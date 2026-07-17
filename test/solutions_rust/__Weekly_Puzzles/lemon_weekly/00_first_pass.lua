local LizLemon = max(abs(x), abs(y), abs(z), abs(x)+abs(y)+abs(z)-4)
--return x+y <= -z
--return LizLemon <=6 and x+y <= -z and LizLemon
--return LizLemon <=6 and x+y <= -z and x*y*z%5==0 and YELLOW
--return LizLemon <=6 and x+y <= -z and (LizLemon <=4 and (x%4)*(y%4)*(z%4)==0 and WHITE or YELLOW)
if LizLemon <=6 and x+y <= -z then
	if LizLemon<=3 then
		return (x%4)*(y%4)*(z%4)==0 and WHITE or YELLOW
	elseif LizLemon<=4 then
		return WHITE
	end
	return YELLOW
end
