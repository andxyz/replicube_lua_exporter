-- empty space
-- if x|z>0 or y^2>=16 then return end

local abs_x, abs_y = abs(x-5), abs(y)
local ring_radius = max(abs_x, abs_y)

if z==-x then return RED end
if z==x then return ORANGE end
   
if z<0 and z>-8 then
	if ring_radius == 1 then return BLUE end
	if ring_radius == 2 then return GREEN end
	if ring_radius == 3 then return YELLOW end
end
