--f6
--112
--9.931

--A hyperball before it begins rolling backward through 
--the X and T dimension.
--the ball colors match the distance to the 4D center.
--btw, center t like the other dimensions:
--Use T like X Y and Z to transform this 3D scene into 4D!

-- some negative space, early exits
if x<=-4 then return end
if y>=4 then return end

-- the corner thingy
if y+4<=x then -- Only do the work once inside this slanted area
	local nt= t-5
	local xt= x+nt/2
	if y+6<=xt then return xt end
end

-- In terms of the sphere these are negative spaces, early exits
local Z= z^2
if Z>9 then return end -- outer-maximum of z for sphere
-- Also, now we can reuse Z calculation below
if t<=1 or t>=9 then return end -- sphere missing entirely

-- sphere calculations
local sphere= x^2+y^2+Z
if sphere<=14 then -- trick where we pre-check bounds before calculating nt
	local nt= t-5 -- This lets us define nt within our "if" blocks
	-- This way we do less calculation, pretty sure setting up nt as a local var doesnt hurt due to the Jit in "Luajit"
	sphere= nt^2+sphere
	if sphere<=15 then 
		return sphere^0.5
	end
end
