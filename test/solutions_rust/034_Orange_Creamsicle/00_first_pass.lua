-- YUMMY!
local X,Z=x*x,z*z
if z==0 then
	if x==0 and y<0 then
		return PEACH
	elseif X<2 and y<4 and y>-2 then
		return WHITE
	end
end
if Z<2 and X<5 and y<5 and y>-3 then
	return ORANGE
end
