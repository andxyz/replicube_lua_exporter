--57
--26.669

--color= {LIGHTBLUE, LIGHTGREEN, ORANGE}
--band_num= abs(z)//2+1
--offset= y<0 and y//6*2 or 0 
--swirl= max(abs(x+offset),abs(y))
--jog= 2^(3-abs(z)//2)
--return
--swirl&1==1 and 
--swirl<jog and 
--color[band_num]

local swirl= max(abs(x+y//6*2),abs(y))
local jog= 2^(3-abs(z)//2)
return swirl&1==1 and 
swirl<jog and
({LIGHTBLUE, LIGHTGREEN, ORANGE})[abs(z)//2+1]
