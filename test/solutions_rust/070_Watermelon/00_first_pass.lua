-- watermelon = portion of a sphere
-- plate = circle

-- empty space above
if abs(z)>=-y+1 then return end

local X,Y,Z = x^2,y^2,z^2

-- plate
if y==-7 and Z+X<=48 then return WHITE end

-- water melon
local s = round(sqrt(X+Y+Z))
if s<=6 then
	if s<=5 then
		if z%2==0 and x%3==0 and y%2==0 then
			return BLACK
		end
		return RED
	end
	return GREEN
end
