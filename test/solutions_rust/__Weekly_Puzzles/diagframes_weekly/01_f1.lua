--f1
--162
--17.005
local X,Y,Z=x*x,y*y,z*z
-- outer box
if X==16 and Z==16 then
	return WHITE 
end
if X==16 and Y==16 then
	return WHITE 
end
if Y==16 and Z==16 then
	return WHITE
end
-- inner thingy
-- RED
if y==0 and z==0 then
	return RED
end
if x==0 and z==0 then
	return RED
end
if x==0 and y==0 then
	return RED
end
-- LIGHTGREEN
if y==-2 and z==-2 then
	return LIGHTGREEN
end
if x==-2 and z==-2 then
	return LIGHTGREEN
end
if x==-2 and y==-2 then
	return LIGHTGREEN
end
-- LIGHTBLUE
if y==2 and z==2 then
	return LIGHTBLUE
end
if x==2 and z==2 then
	return LIGHTBLUE
end
if x==2 and y==2 then
	return LIGHTBLUE
end
