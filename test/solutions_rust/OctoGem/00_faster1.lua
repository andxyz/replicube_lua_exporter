--73
--23.883
local d = abs(x)+abs(y)+abs(z)
local v = abs(x)==abs(y) and abs(y)==abs(z)
if d<=6 then
	if d==6 and (y==0 or x==0 or z==0) then return BLACK end
	if d%3==0 and v then return YELLOW end
	return PURPLE
end
