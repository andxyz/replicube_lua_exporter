-- 51
-- 9.712
-- empty space
if y==4 or y==-4 then return end
-- shape
local Y=y*y
local d = x*x + z*z
if Y<=1 then
	return d <= 12
elseif Y<=9 then 
	if d <= 24 then
		return BLACK
	end
end
