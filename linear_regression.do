cls
/*
 __         __     __   __     ______     ______     ______    
/\ \       /\ \   /\ "-.\ \   /\  ___\   /\  __ \   /\  == \   
\ \ \____  \ \ \  \ \ \-.  \  \ \  __\   \ \  __ \  \ \  __<   
 \ \_____\  \ \_\  \ \_\\"\_\  \ \_____\  \ \_\ \_\  \ \_\ \_\ 
  \/_____/   \/_/   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/ /_/ 


 ______     ______     ______    
/\  == \   /\  ___\   /\  ___\   
\ \  __<   \ \  __\   \ \ \__ \  
 \ \_\ \_\  \ \_____\  \ \_____\ 
  \/_/ /_/   \/_____/   \/_____/ 
                                 

*/                                                                                
clear all
set more off
cd "C:\Users\DELL G15\Documents\STATA-DIR"

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

// graph twoway (scatter $xy1_list) ///
// (scatter y1hat $x1list)

predict e1hat, resid
summ e1hat
graph twoway (scatter e1hat $x1list)

test $x1list
