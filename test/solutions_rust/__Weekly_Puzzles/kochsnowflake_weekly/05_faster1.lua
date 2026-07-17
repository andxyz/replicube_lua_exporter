-- 5.471
-- 90
--local ya = x+y+z==0
if x+y+z==0 then
local XYZ = x^2+y^2+z^2
-- local C = {[194]=3,[234]=3,[248]=3,[266]=3} -- color table lookup trick
return
-- plane 1
14 > max(x-y, y-z, z-x) and 1 or
-- plane 2
14 > max(y-x, x-z, z-y) and 2
--and inrange(x^2+y^2+z^2,194,266) and 3 or 
-- the 4 dots for the black triangles
-- or C[XYZ]
or XYZ==194 and 3
or XYZ==234 and 3
or XYZ==248 and 3
or XYZ==266 and 3
--11^2+3^2+8^2  194
--12^2+3^2+9^2  234
--12^2+2^2+10^2 248
--13^2+4^2+9^2  266
end
