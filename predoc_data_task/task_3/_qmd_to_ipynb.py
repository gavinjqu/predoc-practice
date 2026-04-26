"""Convert analysis.qmd -> analysis.ipynb. Inserts a Discussion markdown cell
after every code cell that does not already have a non-empty discussion below it."""
import json, re, uuid, pathlib

QMD = pathlib.Path("analysis.qmd")
OUT = pathlib.Path("analysis.ipynb")

text = QMD.read_text()

# Strip YAML frontmatter and keep it as the first markdown cell (titled header)
fm_match = re.match(r"^---\n(.*?)\n---\n", text, re.DOTALL)
frontmatter = fm_match.group(1) if fm_match else ""
body = text[fm_match.end():] if fm_match else text

# Split body into segments alternating markdown / python code cells
pat = re.compile(r"```\{python\}\n(.*?)```", re.DOTALL)
segments = []
last = 0
for m in pat.finditer(body):
    if m.start() > last:
        segments.append(("md", body[last:m.start()]))
    segments.append(("code", m.group(1)))
    last = m.end()
if last < len(body):
    segments.append(("md", body[last:]))

def md_cell(src):
    return {
        "cell_type": "markdown",
        "id": uuid.uuid4().hex[:12],
        "metadata": {},
        "source": src.splitlines(keepends=True),
    }

def code_cell(src):
    return {
        "cell_type": "code",
        "id": uuid.uuid4().hex[:12],
        "metadata": {},
        "execution_count": None,
        "outputs": [],
        "source": src.splitlines(keepends=True),
    }

# --- Build header markdown from frontmatter ---
title_match = re.search(r'^title:\s*"?(.*?)"?\s*$', frontmatter, re.MULTILINE)
author_match = re.search(r'^author:\s*"?(.*?)"?\s*$', frontmatter, re.MULTILINE)
title = title_match.group(1) if title_match else "Analysis"
author = author_match.group(1) if author_match else ""
header_md = f"# {title}\n\n*{author}*\n\n"

cells = [md_cell(header_md)]

# Detect whether the markdown immediately following a code cell already serves
# as discussion. We treat any non-empty markdown block as sufficient — but if
# the next markdown segment is purely a new section header (`## ...`) followed
# only by another code block, we insert a Discussion stub before that header.
def is_discussion_present(md_text):
    """Return True if md_text contains discussion content (not just a new header)."""
    stripped = md_text.strip()
    if not stripped:
        return False
    # If the whole block is just heading lines, it's not a discussion
    non_heading = [ln for ln in stripped.splitlines()
                   if ln.strip() and not ln.lstrip().startswith("#")]
    return len(non_heading) > 0

DISCUSSION_STUB = "**Discussion:**\n\n*[Add discussion of the result above.]*\n"

for i, (kind, src) in enumerate(segments):
    if kind == "md":
        cells.append(md_cell(src))
    else:  # code
        cells.append(code_cell(src.rstrip("\n")))
        # Look at the next segment to decide whether to inject a discussion stub.
        next_seg = segments[i + 1] if i + 1 < len(segments) else None
        if next_seg is None or next_seg[0] == "code":
            # code followed by code (or end) -> insert discussion stub
            cells.append(md_cell(DISCUSSION_STUB))
        else:
            # next is markdown; check if it actually discusses or just opens a new section
            if not is_discussion_present(next_seg[1]):
                cells.append(md_cell(DISCUSSION_STUB))

nb = {
    "cells": cells,
    "metadata": {
        "kernelspec": {
            "display_name": "Python 3",
            "language": "python",
            "name": "python3",
        },
        "language_info": {"name": "python"},
    },
    "nbformat": 4,
    "nbformat_minor": 5,
}

OUT.write_text(json.dumps(nb, indent=1))
print(f"Wrote {OUT} with {len(cells)} cells "
      f"({sum(c['cell_type']=='code' for c in cells)} code, "
      f"{sum(c['cell_type']=='markdown' for c in cells)} markdown)")
