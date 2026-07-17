--41
--19.650
d = floor(sqrt((sqrt(x*x+z*z) - 7)^2 + y*y))
return d<=3 and (y>0 and d==3 and PINK or YELLOW)
