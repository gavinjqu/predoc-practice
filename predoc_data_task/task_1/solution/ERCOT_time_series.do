*import electricity data
//import delimited "/user/dm3701/Desktop/ercot_resource_output.csv", clear
import delimited "/Users/djscolari/Dropbox/academia/mit/coding_sample/task data/ercot_resource_output.csv", clear
// replace sced_time_stamp=substr(sced_time_stamp, 1,13)
// collapse (sum) telemetered_net_output, by(year month day hour sced_time_stamp)

* how many unique resource names?
egen i = seq(), by(resource_name)
browse if i == 1 // 1121 of 3008438 are displayed in the browser

* how many unique qse? 
drop i
egen i = seq(), by(qse)
browse if i == 1 // 194 of 3008438 are displayed in the browser

* how many qse/resource_name pairs
drop i
egen i = seq(), by(qse resource_name)
browse if i == 1 // 194 of 3008438 are displayed in the browser

* how many resource names per qse
egen sum = sum(i), by(qse i)
egen j = seq(), by(qse)
browse if j == 1
gsort -sum // the top 10 shown here is the answer

* 
drop i j sum
egen i = seq(), by(qse resource_name)
egen sum = sum(i), by(resource_name i)
tab resource_name if sum > 1 & i == 1 // these 6 resource names have more than one qse

* for example, MUSTNGCK_BES1 swithces from QENEL5 to QENEL10 on Jan. 25th
sort sced_time_stamp
browse if resource_name == "MUSTNGCK_BES1" // you can see these by viewing the data

import delimited "/Users/djscolari/Dropbox/academia/mit/coding_sample/task data/ercot_resource_types.csv", clear
// for some reason it wont let me use firstrow as var names
drop if v1 == "resource_name"
rename v1 resource_name
rename v2 resource_type

* how many unique non-missing resource types
egen i = seq(), by(resource_type)
browse if i == 1 & resource_type != "" // displaying 15 unique resource types
drop i
* missing?
browse if resource_type == "" 
replace resource_type = "WIND" if resource_name == "SSPURTWO_WIND_1" | resource_name == "SWEETWN2_WND24"
replace resource_type = "PVGR" if resource_name == "GALLOWAY_SOLAR1" | resource_name == "ROSELAND_SOLAR3"
browse

import delimited "/Users/djscolari/Dropbox/academia/mit/coding_sample/task data/ercot_resource_output.csv", clear
// replace sced_time_stamp=substr(sced_time_stamp, 1,13)
// collapse (sum) telemetered_net_output, by(year month day hour sced_time_stamp)

*6. Plot the sum of hourly electricity usage throughout the sample. Do you notice any patterns? Is there a significant linear trend
sort month day hour
gen seq=1
replace seq=seq[_n-1]+1 if _n>1
sort seq
twoway (line telemetered_net_output seq) (lfit telemetered_net_output seq), title("Hourly electricity usage") xtitle("Time") ytitle("Electricity usage")

reg telemetered_net_output seq
*There is a clear daily pattern, and a significant negative linear trend over the sample.

*7. Does this data look stationary? Test for a unit root and interpret the result. Now calculate its first difference and plot it. Does it look stationary?
sort seq
tsset seq
dfuller telemetered_net_output, trend
*The dickey-fuller test allows us to reject the null that there is a unit root.

sort seq
gen output_diff=telemetered_net_output-telemetered_net_output[_n-1]
dfuller demeaned_output, trend
twoway (line output_diff seq) (lfit output_diff seq), title("1st diff hourly electricity usage") xtitle("Time") ytitle("Electricity usage")
*Once again, it passes df. However, the data are not stationary, there is a clear seasonality.


*8. Plot the deseasonalized sum as well, subtracting mean usage in each hour. Using the mean usage in each hour, what time of day is electricity usage highest in this sample?

save ercot, replace

collapse (mean) mean_output_diff=output_diff mean_output=telemetered_net_output, by(hour)
save temp, replace

use ercot, clear
merge m:1 hour using temp
gen demeaned_output=telemetered_net_output-mean_output
sort mean_output

*8AM, although there appear to be peaks in the morning and afternoon.
sort seq
twoway line demeaned_output seq, sort title("Demeaned hourly electricity usage") xtitle("Time") ytitle("Electricity usage")

*4. Fit an AR(3) on electricity usage and demeaned electricity usage. Do you believe either of these models is a good fit? Why or why not? 
sort seq
forvalues i=1/3{
	gen telemetered_net_output_lag_`i'=telemetered_net_output[_n-`i']
	gen demeaned_output_lag_`i'=demeaned_output[_n-`i']
}
sort seq
reg telemetered_net_output telemetered_net_output_lag_1 telemetered_net_output_lag_2 telemetered_net_output_lag_3
twoway (scatter telemetered_net_output telemetered_net_output_lag_1) (lfit telemetered_net_output telemetered_net_output_lag_1), title("Electricity vs 1st Lag")

reg demeaned_output demeaned_output_lag_1 demeaned_output_lag_2 demeaned_output_lag_3
twoway (scatter demeaned_output demeaned_output_lag_1) (lfit demeaned_output demeaned_output_lag_1), title("Demeaned Electricity vs 1st Lag")

*Both have a high r squared, and the coefficient is significant. Additionally, the graph seems to indicate a strong linear relationship between electricity and its lag. But the AR model indicates a constant relationship between electricity usage an hour ago and electricity now, which is clearly only true once we remove the hourly means from the data. Both also miss the nonlinear overarching pattern in usage over the sample.


