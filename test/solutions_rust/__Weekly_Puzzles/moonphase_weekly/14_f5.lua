--f5 -- try not to use functions, round2
--558
--8.564

-- trim negative space
if z<-1 or z>1 then return end
local circ= x^2+y^2
if circ > 50 then return end
if circ < 16 then return end
if circ == 45 then return end
if x>6 or x<-6 then return end
if y>6 or y<-6 then return end
if x==-2 or x==2 then return end
if y==-2 or y==2 then return end

-- inline the functions
-- extract common vars

--local d= pi/4
--local i= 0
--local a= d*(t+i)
--local xpx= round(x - 5*sin(i*d))
-- if xpx^2 + (round(y - 5*cos(i*d)))^2 + z^2 <= 3 then
--	return xpx*cos(a) - z*sin(a) + 2.5
--end

local Z= z*z
local d= pi/4

if (x  )^2+(y-5)^2+Z<= 3 then
	local a= t*d
	return x*cos(a) - z*sin(a) + 2.5
end
if (x  )^2+(y+5)^2+Z<= 3 then
	local a= (t+4)*d
	return x*cos(a) - z*sin(a) + 2.5
end
if (x-5)^2+(y  )^2+Z<= 3 then
	local i= 2
	local a= d*(t+i)
	local xpx= round(x - 5*sin(i*d))
	return xpx*cos(a) - z*sin(a) + 2.5
end
if (x+5)^2+(y  )^2+Z<= 3 then
	local i= 6
	local a= d*(t+i)
	local xpx= round(x - 5*sin(i*d))
	return xpx*cos(a) - z*sin(a) + 2.5
end
local xm4= (x-4)^2
local ym4= (y-4)^2
if xm4+ym4+Z<= 3 then
	local i= 1
	local a= d*(t+i)
	local xpx= round(x - 5*sin(i*d))
	return xpx*cos(a) - z*sin(a) + 2.5
end
local yp4= (y+4)^2
if xm4^2+yp4+Z<= 3 then
	local i= 3
	local a= d*(t+i)
	local xpx= round(x - 5*sin(i*d))
	return xpx*cos(a) - z*sin(a) + 2.5
end
local xp4= (x+4)^2
if xp4^2+yp4^2+Z<= 3 then
	local i= 5
	local a= d*(t+i)
	local xpx= round(x - 5*sin(i*d))
	return xpx*cos(a) - z*sin(a) + 2.5
end
if xp4^2+ym4+Z<= 3 then
	local i= 7
	local a= d*(t+i)
	local xpx= round(x - 5*sin(i*d))
	return xpx*cos(a) - z*sin(a) + 2.5
end
