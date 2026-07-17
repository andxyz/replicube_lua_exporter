-- f3
-- 77
-- 8.862

if y>4 then return end -- negative space
local c=x*x+z*z
if y>-6 then
	if y==4 then if c<=21 then return BLACK else return end end
	if c>20 then return end -- negative space
	if c<13 then return end -- negative space
	if y>=-3 then
		return BLACK
	else
		return RED
	end
end
if c<13 then return end -- negative space
if c>41 then return end -- negative space
return BLACK
