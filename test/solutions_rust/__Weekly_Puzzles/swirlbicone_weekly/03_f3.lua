-- 45
-- 21.298
local swirl= max(abs(x+y//6*2),abs(y))
local jog= 8>>abs(z)//2
if swirl>jog then return end
return swirl&1==1 and PURPLE+jog
