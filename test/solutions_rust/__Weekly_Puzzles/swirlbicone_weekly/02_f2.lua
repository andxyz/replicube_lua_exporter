-- 45
-- 24.147
local swirl= max(abs(x+y//6*2),abs(y))
local jog= 2^(3-abs(z)//2)
return swirl&1==1 and swirl<jog and PURPLE+jog
