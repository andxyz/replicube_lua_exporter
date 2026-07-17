-- This is not just any winter hat. It's
-- actually a sentient hat that decides which
-- dormitory 'kids' are sorted into in a school
-- for gifted reindeer children that have
-- the magical ability to fly!

-- is_cone = abs(y - 399/100 + 2*(x^2 + z^2)^.5) < 1

local a = x^2 + z^2
if a >= 30 then return end
if abs(y - 3.99 + 2*a^.5) <= 1 then
	if y+4 < 0 then
		return WHITE
	end
	return RED
elseif a + (y-5)^2 < 3 then
	return WHITE
end
