--65
--35.501
v = min(x^2, (abs(x)+abs(t-5)-10)^2) + round(y-sin(t))^2
return
	v + (z+2)^2%12 <= 6 and
	({GREEN,WHITE,PEACH})[1-z//-6] or
	v==0 and ORANGE
