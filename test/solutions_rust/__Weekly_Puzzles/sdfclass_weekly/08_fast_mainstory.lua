-- btw, 17.790 is my fastest
-- 104
-- 17.790

local X,Y,Z=x*x,y*y,z*z
--local inner_test = X<=1 and Y<=1 or X<=1 and Z<=1 or Y<=1 and Z<=1
--local mengerish = X%3 +Y%3 + Z%3 > 1
if X<=1 and Y<=1 or X<=1 and Z<=1 or Y<=1 and Z<=1 then
  if X%3 +Y%3 + Z%3 > 1 then
		return ({7,6, 11,10,9, 14,13})[y+4]
	else return PEACH end
else
	if X%3 +Y%3 + Z%3 <= 1 then
		return y+10
	end
end
