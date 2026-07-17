-- empty space
if y<-9 or y>9 or z<-9 or z>9 then return end
-- math
local T=(t-16)^2 
return T+x^2+y^2+z^2 < 2*(400+x^2*T)^.5 + 50 and abs(x)+1
-- 67
-- 10.497