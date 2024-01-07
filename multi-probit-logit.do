cls
clear all
set more off
cd "C:\Users\DELL G15\Documents\STATA-DIR"
use auto_2

label define price4lab 1 "high" 2 "average" 3 "low" 4 "poor"
label values price4 price4lab

gen weight4=weight/1000

global ylist price4
global xlist weight4

describe $ylist $xlist
summ $ylist $xlist

tab $ylist

mlogit $ylist $xlist

// average is not significant so it is not interpreted
// if weight is increased higher then low is more likely compared with high
// if weight is higher then poor is more likely compared with high


//set baseoutcome to be average
mlogit $ylist $xlist, baseoutcome(2)
// high is less likely compared with average


mfx, predict(pr outcome(1))
mfx, predict(pr outcome(2))
mfx, predict(pr outcome(3))
mfx, predict(pr outcome(4))

predict pmlogit1 pmlogit2 pmlogit3 pmlogit4, pr 
summ pmlogit1 pmlogit2 pmlogit3 pmlogit4

tab $ylist
