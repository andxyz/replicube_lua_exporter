--52
--12.031
d = floor(sqrt((sqrt(x^2+z^2) - 7)^2 + y*y))
if d <= 3 then
	return y>0 and d==3 and PINK or YELLOW
end
