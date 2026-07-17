--[[
The formula for distance is essentially the same for a 
circle (2D) and a sphere (3D), just with the addition of the
z coordinate:

Radius = sqrt(x^2 + y^2 + z^2)
--]]
local d = round(sqrt(x^2 + y^2 + z^2))
return d<=1 and 7 or d<=4 and 8 or d<=5 and 10