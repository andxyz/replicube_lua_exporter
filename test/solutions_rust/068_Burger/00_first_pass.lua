-- this is a tasty burger!
-- look out for the signature grill marks :)

-- empty space
if y>3 or y<-2 then return end
local c = round(sqrt(x^2+z^2)) -- circle
if c>=6 then return end

if c<6 then 
-- patty
if y==-1 then
	return x%4==-z%4 and BROWN or DARKBROWN 
end

-- bottom bun + boring layers
if y^2<=4 then
	return y^2==4 and ORANGE or YELLOW+y
end
end

-- topbun
if y==3 and c<5 then
	if x%2==0 then
		return z%4==0 and PEACH or ORANGE
	else
		return z^2==4 and PEACH or ORANGE
	end
	return ORANGE
end
-- 118-- this is a tasty burger!
-- look out for the signature grill marks :)

-- empty space
if y>3 or y<-2 then return end
local c = round(sqrt(x^2+z^2)) -- circle
if c>=6 then return end

if c<6 then 
-- patty
if y==-1 then
	return x%4==-z%4 and BROWN or DARKBROWN 
end

-- bottom bun + boring layers
if y^2<=4 then
	return y^2==4 and ORANGE or YELLOW+y
end
end

-- topbun
if y==3 and c<5 then
	if x%2==0 then
		return z%4==0 and PEACH or ORANGE
	else
		return z^2==4 and PEACH or ORANGE
	end
	return ORANGE
end
-- 118
-- 11.008
