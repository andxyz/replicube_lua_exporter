-- 59
-- 33.533
L=max(abs(x), abs(y), abs(z), abs(x)+abs(y)+abs(z)-4)
return L<=6 and x+y<=-z 
and 
	(
		L==4 or
		L<4 and x*y*z==0 or
		YELLOW
	)
