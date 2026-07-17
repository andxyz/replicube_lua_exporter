-- More food!  This time I went for a
-- 'blocky strawberry' look :)

-- Notes:
-- remember you can peek inside objects
-- by dragging the red, green, and blue
-- arrowheads.
-- the inside 3x3x3 of this cute strawberry is all
-- color 4.

if y == 2 then
	return y^2 - x^2 - z^2 + 1 > 0 and GREEN or RED
elseif abs(x) < 2 and abs(y) < 2 and abs(z) < 2 then
	return PEACH
elseif x^2 + y^2 + z^2 == 6 and x == y then
	return PEACH
elseif z == 0 and y == 0 then
	return PEACH
elseif y == -2 and (x == 0 and z == -1 or x == 1 and z == 1) then
	return PEACH
else
	return RED
end