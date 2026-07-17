-- 88
-- 9.965
local X= x*x
local sphere= X+y*y+z*z
if sphere>=13 then return end
if sphere>=7 then
	if y<0 then return WHITE end
	if y>1 then return WHITE end
	return
end
if sphere<=5 then 
	if y==1 and z==1 and X==1 then return LIGHTBLUE end
	if z==2 and x==0 and y==0 then return ORANGE end
	return YELLOW
end
