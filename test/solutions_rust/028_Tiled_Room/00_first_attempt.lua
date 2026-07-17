-- Start of a little domestic scene
-- (could use some furniture tho)

-- Notes:
-- multiple techniques at once!

if y > -6 then -- compute above floor
	if z == 6 and abs(x) < 4 and abs(y) < 4 then -- paint inside window frame
	  v = x^2 + y^2
		return (v%3 ~= 1 and v~=0 and v < 9) 
						  and EMPTY 
					  	or BROWN
	elseif x == -6 or z == 6 then -- paint walls
		return WHITE
	end 
else -- compute the floor
	return (x+z)%2 == 0 and DARKBLUE 
		  or LIGHTBLUE
end
