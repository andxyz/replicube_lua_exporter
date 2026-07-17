--f1
--264
--115.608
local function c(x,y,z)
	return x*x+y*y+z*z <= 3
end
local function shade(x,y,z,offset)	
	local a= (t+offset)*(pi/4)
	return clamp(2+round(x*cos(a))-round(z*sin(a)),1,3)
end

return
c(x,y-5,z) and shade(x,y-5,z,0)
or c(x-4,y-4,z) and shade(x-4,y-4,z,1)
or c(x-5,y,z) and shade(x-5,y,z,2)
or c(x-4,y+4,z) and shade(x-4,y+4,z,3)
or c(x,y+5,z) and shade(x,y+5,z,4)
or c(x+4,y+4,z) and shade(x+4,y+4,z,5)
or c(x+5,y,z) and shade(x+5,y,z,6)
or c(x+4,y-4,z) and shade(x+4,y-4,z,7)
