--small5
--65
--35.501
--y = round(y-sin(t))^2
--x = min(x^2, (abs(x)+abs(t-5)-10)^2)
--x = abs(x)>=3 and abs(x)+abs(t-5)-10 or x
v = min(x^2, (abs(x)+abs(t-5)-10)^2) + round(y-sin(t))^2
return
--x^2 + y + (z+2)^2%12 <= 6 and 
--x + y + (z+2)^2%12 <= 6 and 
v + (z+2)^2%12 <= 6 and
--({GREEN,WHITE,PEACH})[(z+11)//6] or
({GREEN,WHITE,PEACH})[1-z//-6] or
v==0 and ORANGE
