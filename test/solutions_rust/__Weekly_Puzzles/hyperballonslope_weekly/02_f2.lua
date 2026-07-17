--f2
--118
--11.884

--A hyperball before it begins rolling backward through 
--the X and T dimension.
--the ball colors match the distance to the 4D center.

-- some negative spaces, early exits
if y>3 then return end
if x<-3 then return end
if y<-3 and x<-1 then return end
if y>1 and x>3 then return end

--let's center t like the other dimensions:
local nt= t-5

--Use T like X Y and Z to transform this 3D scene into 4D!

local xt= x+nt/2
if y+6<=xt then
	return xt
else
	-- easy negative spaces, early exits
	if t<=1 then return end
	if t>=9 then return end
	if z>3 then return end 
	if z<-3 then return end
	
	local d= (nt^2+x^2+y^2+z^2)^.5
	if d<4 then return
		d
	end
end
