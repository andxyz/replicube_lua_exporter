-- not exactly a flower, but I
-- liked the pattern once I made it.

-- Notes:
-- you can use '~=' to check if a value
-- is NOT EQUAL to another value!

if z>=-1 and z<=1 then 
	if y < 0 then y=-y end
	if x < 0 then x=-x end
	
	if x + y ~=3 then
		return x + y + 6
	end
end
-- cycles: 6.443