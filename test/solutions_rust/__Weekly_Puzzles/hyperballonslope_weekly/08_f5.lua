--f5
--111
--10.107

--A hyperball before it begins rolling backward through 
--the X and T dimension.
--the ball colors match the distance to the 4D center.
--btw, center t like the other dimensions:
--Use T like X Y and Z to transform this 3D scene into 4D!

-- some negative space, early exits
if y>3 then return end
if x<-3 then return end

-- the corner thingy	
if y+4<=x then
	local nt= t-5
	local xt= x+nt/2
	if y+6<=xt then return xt end
end

-- In terms of the sphere these are negative spaces, early exits
if t<=1 or t>=9 then return end -- sphere missing entirely
if z>3 or z<-3 then return end -- outer-maximum of z

-- sphere calculations
local sphere= x^2+y^2+z^2
if sphere<16 then
	local nt= t-5
	sphere= nt^2+sphere
	if sphere<16 then 
		return sphere^0.5
	end
end
