--f4 -- dont use functions
--524
--10.373

-- trim negative space
if z<-1 or z>1 then return end
local circ= x^2+y^2
if circ > 50 then return end
if circ < 16 then return end
if x>6 or x<-6 then return end
if y>6 or y<-6 then return end

-- removed function
-- setup cube test function with embeded shading math
-- local function c(x,y,z,offset)
-- 	if x*x+y*y+z*z <= 3 then
-- 		local a= (t+offset)*(pi/4)
-- 		return clamp(2+round(x*cos(a))-round(z*sin(a)),WHITE,BLACK)
-- 	end
-- 	return
-- end

-- inline the function with some shortcuts applied
-- grouped the x minus 4 and x plus 4 to do some precomputed values 
local Z= z*z
if (x  )^2+(y-5)^2+Z<= 3 then
	local a= (t)*(pi/4)
	return clamp(2+round(x*cos(a))-round(z*sin(a)),WHITE,BLACK)
end
if (x  )^2+(y+5)^2+Z<= 3 then
	local a= (t+4)*(pi/4)
	return clamp(2+round(x*cos(a))-round(z*sin(a)),WHITE,BLACK)
end
if (x-5)^2+(y  )^2+Z<= 3 then
	local a= (t+2)*(pi/4)
	return clamp(2+round((x-5)*cos(a))-round(z*sin(a)),WHITE,BLACK)
end
if (x+5)^2+(y  )^2+Z<= 3 then
	local a= (t+6)*(pi/4)
	return clamp(2+round((x+5)*cos(a))-round(z*sin(a)),WHITE,BLACK)
end
local xm4= (x-4)^2
local ym4= (y-4)^2
if xm4+ym4+Z<= 3 then
	local a= (t+1)*(pi/4)
	return clamp(2+round((x-4)*cos(a))-round(z*sin(a)),WHITE,BLACK)
end
local yp4= (y+4)^2
if xm4^2+yp4+Z<= 3 then
	local a= (t+3)*(pi/4)
	return clamp(2+round((x-4)*cos(a))-round(z*sin(a)),WHITE,BLACK)
end
local xp4= (x+4)^2
if xp4^2+yp4^2+Z<= 3 then
	local a= (t+5)*(pi/4)
	return clamp(2+round((x+4)*cos(a))-round(z*sin(a)),WHITE,BLACK)
end
if xp4^2+ym4+Z<= 3 then
	local a= (t+7)*(pi/4)
	return clamp(2+round((x+4)*cos(a))-round(z*sin(a)),WHITE,BLACK)
end
