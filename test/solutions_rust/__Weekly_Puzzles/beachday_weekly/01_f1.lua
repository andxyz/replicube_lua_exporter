-- f1
-- 358
-- 10.087

if y<0 then -- below floor
	if z==5 and y==-6 then return DARKBLUE end
	if z<-y then return YELLOW end
	if y>-3 then return BLUE else return DARKBLUE end
end

-- above floor
if y==6 then return end
if y==5 then
	if x==-4 and z==-4 then return RED end -- beachball
end
if y==4 then
	if x==3 and z==-4 then return RED end -- umbrella dot
end
if y==3 then
	if x==-5 and z<-1 then -- net
		if (z+2)%4==0 then return GREY else return WHITE end
	end
	-- umbrella
	local c= (x-3)^2+(z+4)^2
	if c<1 then return BLACK end
	if c==1 then return PURPLE end
	if c<=7 then return RED end
end
if y==2 then
	if x==-5 and z<-1 then -- net
		if (z+2)%4==0 then return GREY else return WHITE end
	end
	if x==-3 then -- bouy and person
		if z==4 then return GREY end
		if z==-4 then return PINK end
	end
	if x==2 and z==-4 then return BLACK end -- umbrella stand
end
if y==1 then
	if x==-5 and z<-1 then -- net
		if (z+2)%4==0 then return GREY end
	end
	if x==3 or x==4 then
		if z<=-2 and z>=-5 then return z%2+PEACH end -- umbrella-bathers
	end
	if x==-3 then -- bouy and person 
		if z==4 then return GREY end
		if z==-4 then return PINK end
	end
	if x==1 and z==-4 then return BLACK end -- umbrella stand
	if x==-2 and z==4 then return GREY end -- bouy
end
if y==0 then -- floor level
	if z>0 then return BLUE end
	if z==0 then
		if (x-1)%3==0 then return LIGHTBLUE else return BLUE end
	end
	return YELLOW 
end
