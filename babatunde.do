cls
clear
sysuse nlsw88.dta

desc

tab race married

contract m~d race
list

collapse (count) id~e, by (m~d r~e)
list

recode grade (0/4=1 "fail") (5/7=2 "pass") (8/14=3 "very good") (15/18=4 "excellent"), generate(grade_cat)

br grade grade_cat

tab grade_cat
