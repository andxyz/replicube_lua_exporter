-- More food!  This time I went for a
-- 'blocky strawberry' look :)

-- 79
-- 12.480
if y == 2 then
	return x^2 + z^2 < 5 and GREEN or RED -- top
elseif x^2 + y^2 + z^2 < 4 then
	return PEACH -- inner-belly-of-the-beast
elseif y == 0 and z == 0 
	  or x == 0 and z == -1 
		or x == 1 and z == 1 then
	return PEACH -- dots
else
	return x == y and y^2 == 1 and PEACH or RED -- dice 2 dots
end
