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
