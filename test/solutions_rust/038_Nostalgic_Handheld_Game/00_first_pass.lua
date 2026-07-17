-- I'm really proud of this one.
-- I had one of these and played it for years.

-- Notes:
-- min() can be used to make cross shapes
-- like the d-pad.

if z^2 < 2 and x^2 < 17 then
	-- screen
	if (y-3)^2 < 5 then
		if x^2 == 9 and z == 1 then
			-- grey bars
			return GREY
		elseif x^2<5 and z > -1 then
			-- recessed green screen
			return z == 0 and GREEN or z == 1 and EMPTY
		end
	elseif y - x < -8 then
		-- chip off the corner
		return EMPTY
	end

	return WHITE -- body of gameboy
elseif z==2 then --
	if (x+2)^2 < 2 and 
		 (y+2)^2 < 2 and 
		 min(abs(x+2),abs(y+2)) == 0 then
		-- the dpad
		return BLACK
	elseif x == 1 and y == -3 or x == 3 and y == -2 then
		-- buttons
		return RED
	end
end
