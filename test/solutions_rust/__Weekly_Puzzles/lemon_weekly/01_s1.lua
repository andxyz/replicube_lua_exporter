-- 68
-- 33.775
LizLemon=max(abs(x), abs(y), abs(z), abs(x)+abs(y)+abs(z)-4)
--return x+y <= -z
--return LizLemon <=6 and x+y <= -z and LizLemon
--return L<=6 and x+y <= -z and L<=3 and (x*y*z==0 and WHITE or YELLOW)
return
LizLemon<=6 and x+y<=-(z) and
	(
		LizLemon<=3 and (x*y*z%5==0 and WHITE or YELLOW)
	 	or LizLemon<=4 and WHITE
		or YELLOW
	)
