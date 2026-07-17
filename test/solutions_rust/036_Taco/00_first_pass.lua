-- Food again, surprise surprise :)

-- Notes:
-- Modulo (%) is your friend for infrequently
-- repeating patterns :)

if y^2 < 16 and z^2 < 5 then
	-- slice top taco
	if y == 3 then return EMPTY end
	if z^2 > 1 and ~x^2 < -(y-6)^2 then return EMPTY end	
	-- slice top ingredients
	if ~x^2 < -(y-7)^2 then return EMPTY end
	-- inner stuff  
	if z^2 < 2 then
		-- tomato
		if y == 2 then 
		  if z == 1 and (x-3)%6==1 then
				return RED
			elseif z == -1 and (x-1)%6==1 then
				return RED
			elseif z == 0 and x == 0 then
				return RED
			end
			return EMPTY
		end
		-- lettuce cheese meat
		if y == 1 then return (x+z)%2==0 and LIGHTGREEN or GREEN end
		if y == 0 then return ORANGE end
		if y == -1 or y == -2 then return DARKBROWN end
	end
	-- the remaining taco shell
	return YELLOW
end



