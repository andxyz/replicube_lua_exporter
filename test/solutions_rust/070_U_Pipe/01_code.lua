-- pipe can be broken up into sections...
-- hint: cut a toriod in half, and then
-- attach cylinders to it.

-- lordy, I needed a zillion tweaks and touchups 
-- and I still couldnt match the U pipe

-- * sR (Small Radius): The thickness of the torus tube
-- * br (Big Radius): The distance from the center of the hole to the middle of the tube
-- * ang (Angle): The horizontal angle (in radians)
-- of the point (x, z) relative to the center of the torus
-- * cx, cz (Center Coordinates): The closest point on the major ring to your current position
-- * sin(ang) * bigRadius and cos(ang) * bigRadius, map the angle back onto a circle of bigRadius
-- * dx, dy, dz (Delta/Difference): The distance vector from 
-- the ring's center line to the point (x, y, z)
if y>5 or y==-extent or x==extent or x==-extent then return end

local r = 2.5 -- smallradius, tube radius
local R = 4 -- bigradius, from the center of the hole to the middle of the tube
local a = atan(x,y)
local cx = sin(a)*R
local cy = 1 + cos(a)*R
local dx = x - cx
local dy = (y+2) - cy
local dz = z
-- * du (Distance): The length of that delta vector.
-- This tells you how far the point is from the center of the toroid.
local dUpipe = dx^2+dy^2+dz^2

if y<=-3 then
	-- rest of Upipe
	if dUpipe<r then return BLUE end
	if dUpipe<7 then return LIGHTGREEN end
end
if y>-3 then
	local p2 = round(sqrt((x-4)^2+z*z))
	local p1 = round(sqrt((x+4)^2+z*z))
	if y<=2 then
		if p1<2 or p2<2 then return BLUE end
		if p1==2 or p2==2 then return LIGHTGREEN end
	elseif p1==3 or p2==3 then
		return y<=5 and LIGHTGREEN
	elseif p1<3 or p2<3 then
		return y<=4 and BLUE
	end
end