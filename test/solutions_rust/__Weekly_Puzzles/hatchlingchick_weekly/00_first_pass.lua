-- 76
-- 10.589
local X= x*x
local sphere= X+y*y+z*z
if sphere<=5 then 
	if X==1 and y==1 and z==1 then return LIGHTBLUE end
	if x==0 and y==0 and z==2 then return ORANGE end
	return YELLOW
end
if sphere<=12 and sphere>=7 then
	return y<0 or y>1
end
