-- 21.747
-- 231
--function kochFold(x,y,z,offset)
function kf(x,y,z,of)
	if x<y then x,y = y,x end
	if y<z then y,z = z,y end
	if x<y then x,y = y,x end
	return x,y,z
end

--function koch_iter(x,y,z,offset,distance)
function ki(x,y,z,d)
	-- 1 fold
  x,y,z = kf(x,y,z,of)
	-- 3 scale
	x,y,z= 1.2*x,1.2*y,1.2*z
	-- distance estimate
  return max(x-y, y-z, z-x) + d
end

local ya = (x+y+z)==0
local XYZ = x^2+y^2+z^2
return 
ya and 14 > max(x-y, y-z, z-x)     and 1 or
ya and 13 > ki(x,y,z,-3)  and 2
--(x+y+z)==0 and x^2+y^2+z^2==194 and 3
--(x+y+z)==0 and inrange(x^2+y^2+z^2,194,266) and 3 or 
or ya and XYZ==194 and 3
or ya and XYZ==234 and 3
or ya and XYZ==248 and 3
or ya and XYZ==266 and 3
--11^2+ 3^2+8^2 194
--12^2+3^2+9^2 234
--12^2+2^2+10^2 248
--13^2+4^2+9^2 266