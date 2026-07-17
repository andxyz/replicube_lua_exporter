--small4
--70
--34.501
y = round(y-sin(t))^2
x = min(x^2, (abs(x)+abs(t-5)-10)^2)
--x = abs(x)>=3 and abs(x)+abs(t-5)-10 or x
return 
--x^2 + y + (z+2)^2%12 <= 6 and 
x + y + (z+2)^2%12 <= 6 and 
({GREEN,WHITE,PEACH})[1-z//-6] or
x|y==0 and ORANGE
