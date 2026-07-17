-- 52
-- 30.000
local box1 = max(abs(x-2),abs(y-2),abs(z-2))
local box2 = max(abs(x+2),abs(y+2),abs(z+2))
--return min(box1,box2) == 4 and WHITE
return min(box1,box2) == 4
