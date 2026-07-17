-- 68
-- 33.775
L=max(abs(x), abs(y), abs(z), abs(x)+abs(y)+abs(z)-4)
return 
L<=6 and x+y<=-z and 
	(
		L<=3 and (x*y*z%5==0 and WHITE or YELLOW) 
	 	or L<=4 and WHITE
		or YELLOW
	)
