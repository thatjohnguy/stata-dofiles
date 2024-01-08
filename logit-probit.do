cls
clear
set more off
use auto_2

global ylist foreign
global xlist price_d mpg rep78 headroom trunk weight length turn displacement gear_ratio

desc $ylist $xlist
summ $ylist $xlist

tab $ylist

reg $ylist $xlist

probit $ylist $xlist

logit $ylist $xlist
