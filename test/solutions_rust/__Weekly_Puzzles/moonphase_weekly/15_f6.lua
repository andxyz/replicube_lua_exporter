--f6 inline all the things
--409
--6.892

-- This was too far for me, I tried to catch CrashT, they are too fast

-- I want to go back to my second solution which I could actually read.

--local function c(x,y,z,offset)
--	if x*x+y*y+z*z <= 3 then
--		local a= (t+offset)*(pi/4)
--		return clamp(2+round(x*cos(a))-round(z*sin(a)),1,3)
--	end
--	return
--end
--
--return
--   c(x  ,y-5,z,0)
--or c(x-4,y-4,z,1)
--or c(x-5,y  ,z,2)
--or c(x-4,y+4,z,3)
--or c(x  ,y+5,z,4)
--or c(x+4,y+4,z,5)
--or c(x+5,y  ,z,6)
--or c(x+4,y-4,z,7)

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

-- inline all the things
-- do bounds checks instead of squareroots for the cubes
local d= pi/4

if y>2 then
	if x>2 then
		local a= d*(t+1)
		local xpx= round(x - 5*sin(1*d))
		return xpx*cos(a) - z*sin(a) + 2.5
	end
	if x<-2 then
		local a= d*(t+7)
		local xpx= round(x - 5*sin(7*d))
		return xpx*cos(a) - z*sin(a) + 2.5
	end
	local a= t*d
	return x*cos(a) - z*sin(a) + 2.5
end

if y<-2 then
	if x>2 then
		local a= d*(t+3)
		local xpx= round(x - 5*sin(3*d))
		return xpx*cos(a) - z*sin(a) + 2.5
	end
	if x<-2 then
		local a= d*(t+5)
		local xpx= round(x - 5*sin(5*d))
		return xpx*cos(a) - z*sin(a) + 2.5
	end
	local a= (t+4)*d
	return x*cos(a) - z*sin(a) + 2.5
end

if x>0 then
	local a= d*(t+2)
	local xpx= round(x - 5*sin(2*d))
	return xpx*cos(a) - z*sin(a) + 2.5
end

local a= d*(t+6)
local xpx= round(x - 5*sin(6*d))
return xpx*cos(a) - z*sin(a) + 2.5
