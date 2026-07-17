
if abs(x) < 2 and y > -2 then
	if z < 3 then
		if y == 3 and z == 1 and abs(x) == 1 then
			return BROWN -- ears
		elseif z == -2 and y == 1 and x == 0 then
			return EMPTY -- tail curl
		elseif x == 0 and abs(z) > 1 and y > 0 and y < 3 then
			return ORANGE -- tail and forehead
		elseif z < 3 and y == 3 or max(z-1, -y) < 0 then
			return EMPTY -- sculpt back
		else
		 return BROWN -- body
		end
	else
		return z == 3 and y == 1 and ORANGE -- snout
	end
elseif (z == -3 or z == 2) and abs(x) == 1 then
	return y == -3 and ORANGE or y == -2 and BROWN -- legs
end

