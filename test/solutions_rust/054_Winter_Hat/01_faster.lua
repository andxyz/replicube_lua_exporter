-- This is not just any winter hat. It's
-- actually a sentient hat that decides which
-- dormitory 'kids' are sorted into in a school
-- for gifted reindeer children that have
-- the magical ability to fly!

-- is_cone = abs(y - 399/100 + 2*(x^2 + z^2)^.5) < 1

local a = x^2 + z^2
-- empty space
if a >= 30 then return end 

-- the hat
if abs(y - 3.99 + 2*a^.5) > 1 then -- outside cone
	if a + (y-5)^2 < 3 then return WHITE end -- ball ontop
else 
	-- inside cone
	if y<-4 then return WHITE end -- bottom trim
	return RED -- rest of the hat
end
