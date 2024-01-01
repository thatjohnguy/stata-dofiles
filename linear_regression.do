clear all
set more off

use auto_2
global ylist mpg
global x1list weight
global xlist weight foreign price_d
global xy_list $ylist $xlist
global xy1_list $ylist $x1list 

describe $ylist $xlist
summarize $ylist $xlist
summarize $ylist, detail

correlate $ylist $xlist

// graph twoway (scatter $ylist $x1list)

reg $xy1_list //its from here the xb is generated

// graph twoway (scatter $xy1_list) ///
// (lfit $xy1_list)

predict y1hat, xb

summarize y1hat $ylist

graph twoway (scatter $xy1_list) ///
(scatter y1hat $x1list)
