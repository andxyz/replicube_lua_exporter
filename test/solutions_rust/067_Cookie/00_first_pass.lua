--[[
each voxel is at a nice integer location, but 
distance is often a decimal number. You can
test against decimal values in your code,
or you can also convert a decimal to an integer
with round(), floor(), and ceil().
--]]
--local d = sqrt(x^2 + z^2)

-- notice how this doesn't make a full circle
-- because the decimal values don't always turn
-- out to be a 'clean' integer
--if z == 3 then
--	return d == 4
--end
--
-- rounding the distance ensures it's an integer
--if z == 0 then
--	return round(d) == 4
--end

-- 40
-- 17.267
local d = round(sqrt(x^2 + z^2))
if y^2<=1 then return d <= 3 end
if y^2<=9 then return d <= 4 and BLACK end
