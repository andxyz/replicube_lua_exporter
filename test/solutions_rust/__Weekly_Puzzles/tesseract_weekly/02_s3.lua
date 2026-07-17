--s3
--66
--267.134

--for i = -6, 6, 12 do -- does only the cubes
for i= -6, 6 do
	t= {abs(x+i), abs(y+i), abs(z+i)} sort(t)

	-- Note: t1 does the diagonals
	-- when i==(6 or -6), t2 does the cubes
  -- print(concat(t, ", "))
	if (i%12==6 and t[2] or t[1])==10 and t[3]==10 then
		return x+y+z&1 | 10
	end
end

-- lua "for" statement https://www.lua.org/pil/4.3.4.html
-- lua "sort()" https://www.lua.org/pil/19.3.html
-- sorting defaults to smallest to largest
-- t1 is min(table_items)
-- t3 is max(table_items)
-- In one function call you get the min() and the max(), and the leftover value in the middle
