-- Chairs and Tables are fun because they
-- are so symmetrical.

-- Notes:
-- look for symmetry and use abs()!
if y < 3 then
	if abs(x) < 2 then
		if abs(z) < 2 and y == -1 then
			return ORANGE
		elseif abs(x) == 1 and (z == -1 or z == 1 and y < -1) then
			return ORANGE
		elseif x == 0 and y == 2 and z == -1 then
			return ORANGE
		end
	end
end

		