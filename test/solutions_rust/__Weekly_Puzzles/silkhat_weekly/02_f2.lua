-- f2
-- 75
-- 8.727

if y>4 then return end
local c=x*x+z*z
if y>-6 then
	if y==4 and c<=21 then return BLACK end
	if c>20 then return end
	if c<13 then return end
	if y>=-3 then
		return BLACK
	else
		return RED
	end
end
if c>=13 and c<=41 then return BLACK end
