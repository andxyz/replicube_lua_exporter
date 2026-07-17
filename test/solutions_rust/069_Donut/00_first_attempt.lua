--[[
equation for a torus (donut):
r^2 = (sqrt(x^2+z^2) - R)^2 + y^2
little r = radius of the 'tube'
big R = radius of the 'ring'

sqrt(x^2+z^2) - R  <-- this is essentially the distance
from the 'ring' on the XZ plane.

remember, when visualizing values as colors, negative
values will all appear as empty space, because any
number <= 0 becomes an empty voxel.
--]]
local r=3
if y>r or y<-r then return end
local R=7
local d = floor(sqrt((sqrt(x^2+z^2) - R)^2 + y^2))
if d <= r then
	return y>0 and d==r and PINK or YELLOW
end
