--57
--8.887
local Y=y*y
if Y>9 then return end
local d = floor(sqrt((sqrt(x^2+z^2) - 7)^2 + Y))
if d<=3 then
	if y>0 and d==3 then
	  return PINK
	else
		return YELLOW
	end
end
