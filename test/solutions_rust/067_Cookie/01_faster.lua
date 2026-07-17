-- 54
-- 15.156
if y==4 or y==-4 then return end
local Y=y*y
local d = round(sqrt(x^2 + z^2)) 
if Y<=1 then
	return d <= 3
elseif Y<=9 then 
	if d <= 4 then
		return BLACK
	end
end
