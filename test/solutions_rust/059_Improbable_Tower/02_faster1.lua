if y == -4 then return GREY end
local yy=(y+4)%4
if z==-2 and x<=3 and x>=-3 and yy==1 then
	return BROWN
end
if x==-2 and z<=3 and z>=-3 and yy==2 then
	return BROWN
end
if z==2 and x<=3 and x>=-3 and yy==3 then
	return BROWN
end
if x==2 and z<=3 and z>=-3 and yy==0 then
	return BROWN
end
