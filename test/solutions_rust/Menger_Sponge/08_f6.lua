-- 78
-- 28.015
local X,Y,Z=x*x,y*y,z*z
if X<=1 and Y<=1 or
	 X<=1 and Z<=1 or
	 Y<=1 and Z<=1 then return end

function f(a)
	return X%a +Y%a + Z%a
end
return f(3) > 1 and f(6) > 6 and 10+y
