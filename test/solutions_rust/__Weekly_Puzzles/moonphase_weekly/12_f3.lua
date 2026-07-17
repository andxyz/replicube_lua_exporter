--f3
--205
--15.252

-- trim negative space
if z<-1 or z>1 then return end
local circ= x^2+y^2
if circ > 50 then return end
if circ < 16 then return end

-- setup cube test function with embeded shading math
local function c(x,y,z,offset)
	if x*x+y*y+z*z <= 3 then
		local a= (t+offset)*(pi/4)
		return clamp(2+round(x*cos(a))-round(z*sin(a)),WHITE,BLACK)
	end
	return
end

return
c(x,y-5,z,0)
or c(x-4,y-4,z,1)
or c(x-5,y,z,2)
or c(x-4,y+4,z,3)
or c(x,y+5,z,4)
or c(x+4,y+4,z,5)
or c(x+5,y,z,6)
or c(x+4,y-4,z,7)
