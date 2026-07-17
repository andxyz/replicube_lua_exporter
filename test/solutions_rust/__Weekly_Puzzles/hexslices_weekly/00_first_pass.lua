-- 56
-- 24.591
--return (abs(x) + abs(y) + abs(z)) < 11 
--and (x+1+y+1+z+1)%3==0 and (x+y+z)%(16*3)+5
--return x+y+z
--local abc=abs(x) + abs(y) + abs(z)
--return abc<12
local C= (x+y+z)/3
--return abs(C) and (C+6%16)
--return min(abs(x-C),abs(y-C),abs(z-C)) < 1
local abc = abs(C)+max(abs(x-C), abs(y-C), abs(z-C))
--return abc<=5
--return abc<=6 and C*3%3==0 and PEACH
--return abc<=6 and C*3%3==0 and C
--return abc<=6 and C*3%3==0 and (C+6)%16
return abc<=6 and C*3%3==0 and (C+6)%12
