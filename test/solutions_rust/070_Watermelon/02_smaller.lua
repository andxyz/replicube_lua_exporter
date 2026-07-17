-- 86
if z-y<0 or -z-y<0 then return end
v=x*x+z*z+y*y
if y==-7 and v-y*y<=48 then return WHITE end

if z%2==0 and x%3==0 and y%2==0 then
	return v<31 and BLACK
end
if vv<43 then
	if v<31 then
		return RED
	end
	return GREEN
end
