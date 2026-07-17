--54
--8.935
local Y=y*y
if Y>9 then return end
local d = floor(sqrt((sqrt(x^2+z^2) - 7)^2 + Y))
if d <= 3 then
	return y>0 and d==3 and PINK or YELLOW
end
