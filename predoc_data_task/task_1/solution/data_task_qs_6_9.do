
log using q6_9_solutions_log.txt, replace
*import electricity data
import delimited "/user/dm3701/Desktop/ercot_resource_types.csv", clear varnames(1)
save ercot_resource_types, replace

import delimited "/user/dm3701/Desktop/ercot_resource_output.csv", clear
merge m:1 resource_name using ercot_resource_types
replace resource_type="OTHER" if missing(resource_type)
gen fuel_type="Other"
replace fuel_type="Natural Gas" if inlist(resource_type,"SCGT90","CCGT90","SCLE90","GSREH","CCLE90","GSSUP","GSNONR")
replace fuel_type="Wind" if inlist(resource_type,"WIND")
replace fuel_type="Solar" if inlist(resource_type, "PVGR")
replace fuel_type="Coal" if inlist(resource_type, "CLLIG")
replace fuel_type="Nuclear" if inlist(resource_type,"NUC")

save ercot_resource_output, replace

*6a
use ercot_resource_output, clear
collapse (sum) telemetered_net_output, by(month day)
sort month day
gen seq=1
replace seq=seq[_n-1]+1 if _n>1
sort seq
twoway (line telemetered_net_output seq) (lfit telemetered_net_output seq), title("Daily electricity usage") xtitle("Time") ytitle("Electricity usage")
graph export "/user/dm3701/Desktop/Graph6a.png", as(png) name("Graph")


use ercot_resource_output, clear
collapse (sum) telemetered_net_output, by(month day hour)
sort month day hour
gen seq=1
replace seq=seq[_n-1]+1 if _n>1
sort seq
twoway (line telemetered_net_output seq) (lfit telemetered_net_output seq), title("Hourly electricity usage") xtitle("Time") ytitle("Electricity usage")
graph export "/user/dm3701/Desktop/Graph6b.png", as(png) name("Graph")

*6c graph
use ercot_resource_output, clear
collapse (sum) telemetered_net_output, by(fuel_type month day hour)
rename telemetered_net_output output
replace fuel_type="Natural_Gas" if fuel_type=="Natural Gas"
reshape wide output, i(month day hour) j(fuel_type) string
sort month day hour
gen seq=1
replace seq=seq[_n-1]+1 if _n>1
sort seq
twoway (line outputCoal seq) (line outputNatural_Gas seq) (line outputNuclear seq) (line outputOther seq) (line outputSolar seq) (line outputWind seq), title("Hourly electricity usage by type") xtitle("Time") ytitle("Electricity usage")
graph export "/user/dm3701/Desktop/Graph6c.png", as(png) name("Graph")

*7
use ercot_resource_output, clear
collapse (sum) telemetered_net_output, by(month day)
sort month day
gen seq=1
replace seq=seq[_n-1]+1 if [_n]>1

sort seq
tsset seq
dfuller telemetered_net_output

sort seq
gen output_diff=telemetered_net_output-telemetered_net_output[_n-1]
twoway (line output_diff seq), title("First Difference of electricity usage") xtitle("Time") ytitle("Change in electricity usage")
graph export "/user/dm3701/Desktop/Graph7.png", as(png) name("Graph")

*8
use ercot_resource_output, clear
collapse (sum) telemetered_net_output, by(month day hour)
sort month day hour
gen seq=1
replace seq=seq[_n-1]+1 if [_n]>1

sort seq
forvalues i=1/3{
	gen telemetered_net_output_lag_`i'=telemetered_net_output[_n-`i']
	gen demeaned_output_lag_`i'=demeaned_output[_n-`i']
}
sort seq
reg telemetered_net_output telemetered_net_output_lag_1 telemetered_net_output_lag_2 telemetered_net_output_lag_3
twoway (scatter telemetered_net_output telemetered_net_output_lag_1) (lfit telemetered_net_output telemetered_net_output_lag_1), title("Electricity vs 1st Lag")
graph export "/user/dm3701/Desktop/Graph8.png", as(png) name("Graph")

*9
*9a
use ercot_resource_output, clear
collapse (sum) telemetered_net_output, by(fuel_type)
reg telemetered_net_output i.fuel_type

*9b
use ercot_resource_output, clear
collapse (sum) telemetered_net_output, by(month day)
sort month day
gen seq=1
replace seq=seq[_n-1]+1 if [_n]>1
gen weekday="Sunday"
replace weekday="Monday" if mod(seq,7)==2
replace weekday="Tuesday" if mod(seq,7)==3
replace weekday="Wednesday" if mod(seq,7)==4
replace weekday="Thursday" if mod(seq,7)==5
replace weekday="Friday" if mod(seq,7)==6
replace weekday="Saturday" if mod(seq,7)==0
encode weekday, gen(coded_weekday)
reg telemetered_net_output i.coded_weekday

*9c
use ercot_resource_output, clear
collapse (sum) telemetered_net_output, by(month day)
sort month day
gen seq=1
replace seq=seq[_n-1]+1 if [_n]>1
gen week=1+floor(seq/7)
reg telemetered_net_output i.week

