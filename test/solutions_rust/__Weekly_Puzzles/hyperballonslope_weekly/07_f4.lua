--f4
--94
--10.827

--A hyperball before it begins rolling backward through 
--the X and T dimension.
--the ball colors match the distance to the 4D center.

-- some negative spaces, early exits
if y>3 or x<-3 then return end
--let's center t like the other dimensions:
local nt= t-5
--Use T like X Y and Z to transform this 3D scene into 4D!
local xt= x+nt/2
if y+6<=xt then return xt end
-- easy negative spaces, early exits
if t<=1 or t>=9 then return end -- ball missing entirely
if z>3 or z<-3 then return end -- outer-maximum of z
-- sphere calculations
local d= x^2+y^2+z^2
if d<16 then
	d= nt^2+d
	if d<16 then return d^.5 end
end
