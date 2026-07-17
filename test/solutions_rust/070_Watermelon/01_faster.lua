-- 92
-- 8.037
-- empty space above
if z-y<0 or -z-y<0 then return end
local Y,XZ=y*y,x*x+z*z
-- plate
if y==-7 and XZ<=48 then return WHITE end
-- water melon
local s2 = XZ+Y
if s2<43 then
	if s2<31 then
		if z%2==0 and x%3==0 and y%2==0 then
			return BLACK
		end
		return RED
	end
	return GREEN
end
