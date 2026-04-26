"""Cell-by-cell runner for analysis.qmd. Used only for the audit; safe to delete."""
import os, re, sys, traceback, warnings, io, contextlib

os.chdir(os.path.dirname(os.path.abspath(__file__)))

# Quarto stages: matplotlib non-interactive, display() shim
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

def _display(*a, **k):
    pass

QMD = "analysis.qmd"
text = open(QMD).read()

# capture {python} ... ``` blocks (handles indentation = 0)
pattern = re.compile(r"```\{python\}\n(.*?)```", re.DOTALL)
cells = pattern.findall(text)

# Build a (start_line, code) list for nicer reporting
positions = []
offset = 0
for m in pattern.finditer(text):
    start_line = text.count("\n", 0, m.start()) + 1
    positions.append((start_line, m.group(1)))

# Optional cell range: python _audit_runner.py START END  (1-indexed inclusive)
start_idx = int(sys.argv[1]) - 1 if len(sys.argv) > 1 else 0
end_idx = int(sys.argv[2]) if len(sys.argv) > 2 else len(positions)

g = {"display": _display, "__name__": "__audit__"}

for i in range(start_idx, end_idx):
    line_no, code = positions[i]
    print(f"\n===== CELL {i+1} (qmd line {line_no}) =====")
    snippet = code.strip().splitlines()[:1]
    print(f"first line: {snippet[0] if snippet else '<empty>'}")
    buf_out, buf_err = io.StringIO(), io.StringIO()
    try:
        with warnings.catch_warnings(record=True) as wlist, \
             contextlib.redirect_stdout(buf_out), \
             contextlib.redirect_stderr(buf_err):
            warnings.simplefilter("always")
            exec(compile(code, f"<cell {i+1}>", "exec"), g)
        plt.close("all")
    except Exception:
        print("STDOUT:")
        print(buf_out.getvalue())
        print("STDERR:")
        print(buf_err.getvalue())
        print("TRACEBACK:")
        traceback.print_exc()
        sys.exit(2)
    out = buf_out.getvalue()
    if out:
        # truncate noisy outputs
        lines = out.splitlines()
        if len(lines) > 30:
            print("STDOUT (truncated, head 15 / tail 15):")
            print("\n".join(lines[:15] + ["..."] + lines[-15:]))
        else:
            print("STDOUT:")
            print(out)
    warn_lines = [str(w.message) for w in wlist if not isinstance(w.message, DeprecationWarning) is False]
    # report unique warning categories
    seen = set()
    for w in wlist:
        key = (w.category.__name__, str(w.message)[:120])
        if key in seen:
            continue
        seen.add(key)
        print(f"WARN [{w.category.__name__}]: {str(w.message)[:200]}")

print("\n===== ALL CELLS COMPLETED =====")
