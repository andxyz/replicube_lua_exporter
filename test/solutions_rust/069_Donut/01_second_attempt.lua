if y>3 or y<-3 then return end
-- This code uses a trigonometric approach to find the distance to a torus. 
-- Instead of the standard vector-based Signed Distance Function (SDF), 
-- it uses an angle to "track" the point's position around the ring.
--
-- Here is the breakdown of how these specific variables interact:
-- ## Geometric Variable Meanings
-- In this specific snippet, the variables are building a 3D vector 
-- that points from the nearest part of the torus "ring" to your current point (x, y, z)
--
-- * sm (Small Radius): The thickness of the torus tube (the "dough")
-- * br (Big Radius): The distance from the center of the hole to the middle of the tube
local sm = 3 -- smallradius, tube radius
local br = 7 -- bigradius, from the center of the hole to the middle of the tube
-- * a (Angle): The horizontal angle (in radians)
-- of the point (x, z) relative to the center of the torus
-- * cx, cz (Center Coordinates): The closest point on the major ring to your current position
-- * sin(da) * dbr and cos(da) * dbr map the angle back onto a circle of radius dbr
local a = atan(x,z)
local cx = sin(a)*br
local cz = cos(a)*br
-- * dx, dy, dz (Delta/Difference): The distance vector from 
-- the ring's center line to the point (x, y, z)
local dx = x - cx
local dy = y
local dz = z - cz
-- * d (Distance): The length of that delta vector.
-- This tells you how far the point is from the center of the "dough."
local d = floor(sqrt(dx^2+dy^2+dz^2))
-- Threshold check, if "d" is below dsmall we are inside the toroid
if d <= sm then
	return y>=1 and d==sm and PINK or YELLOW
end
