-- f8
-- 74 
-- 4.656

if 0>y then return end
if y>9 then return end

if x>z then
	if -9>z then return end
	if y+x>9 then return end
	if y-z>9 then return end
	return WHITE
end

if -9>x then return end
if y+z>9 then return end
if y-x>9 then return end
return WHITE
