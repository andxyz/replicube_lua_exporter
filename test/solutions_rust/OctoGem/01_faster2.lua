--72
--19.147
local d = abs(x)+abs(y)+abs(z)
local v = (x==y or -x==y) and (y==z or -y==z)
if d<=6 then
	if d==6 and x*y*z==0 then return BLACK end
	if d%3==0 and v then return YELLOW end
	return PURPLE
end
