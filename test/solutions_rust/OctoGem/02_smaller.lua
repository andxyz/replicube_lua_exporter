--70
--19.147
d = abs(x)+abs(y)+abs(z)
v = (x==y or -x==y) and (y==z or -y==z)
if d<=6 then
	if d==6 and y*x*z==0 then return BLACK end
	if d%3==0 and v then return YELLOW end
	return PURPLE
end
