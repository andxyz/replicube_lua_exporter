-- Removed the function call
-- Did some checks to try bail early on empty space
if x-1>=-z then return end
if y-1>=-z then return end
if x-1>=-y then return end

local a = -(x-4)//8 -(y-5)//8 -(z-5)//8
--if a<3 then return end
local b = -x//8 -(y-1)//8 -(z-1)//8
--if b<1 then return end 
local c = -x//4 -(y-1)//4 -(z-1)//4
if c<3 then return end 
local d = -x//2 -(y-1)//2 -(z-1)//2
--if d<4 then return end
local e = -x//1 -(y-1)//1 -(z-1)//1
--if e<6 then return end

return
a >= 4 and DARKBLUE or
b==3 and c==4 and BLUE or
c==3 and d==7 and GREY or
d==6 and e ==13 and WHITE

--[[
-- my original solution
function f(scale, offset, offset2)
	return -(x-offset2)//scale -(y-offset)//scale -(z-offset)//scale
end
a = f(8,5,4)
b = f(8,1,0)
c = f(4,1,0)
d = f(2,1,0)
e = f(1,1,0)
return 
a >= 4 and 12 or
b==3 and c==4 and 13 or
c==3 and d==7 and 2 or
d==6 and e == 13
]]--