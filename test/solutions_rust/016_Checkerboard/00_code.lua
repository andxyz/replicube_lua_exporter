-- pretty sure this is related to
-- '%' modulo... basically we want to know if
-- x is 'even', and z is 'even'...

--if x % 2 and y == 0 then
--	if (x % 2) ~= (z % 2) then
--		return BLACK
--	else
--		return WHITE
--	end
--end

return 
y == 0 and (x % 2) ~= (z % 2) and BLACK or 
y == 0 and WHITE