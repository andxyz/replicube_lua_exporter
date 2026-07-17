-- not exactly a flower, but I
-- liked the pattern once I made it.

-- Notes:
-- you can use '~=' to check if a value
-- is NOT EQUAL to another value!

if z^2<3 then
	if x>=0 and y>=0 then
		c = x + y
		return c~=3 and c + 6
	end
  xx = ~x + 1
	yy = y
	if xx>0 and yy>0  then
		c = xx+yy
		return c~=3 and c + 6
	end
	xx = x
	yy = ~y + 1
	if xx>0 and yy>0 then
		c = xx+yy
		return c~=3 and c + 6
	end
	xx = ~x + 1
	yy = ~y + 1
	if xx>=0 and yy>=0 then
		c = xx+yy
		return c~=3 and c + 6
	end
end