-- 78
-- 9.959
local sphere= x*x+y*y+z*z
if sphere>=13 then return end
if sphere>=7 then
	if y<0 then return WHITE end
	if y>1 then return WHITE end
	return
end
if sphere<=5 then 
	if sphere==3 and y+z==2 then return LIGHTBLUE end
	if sphere==4 and z==2 then return ORANGE end
	return YELLOW
end
