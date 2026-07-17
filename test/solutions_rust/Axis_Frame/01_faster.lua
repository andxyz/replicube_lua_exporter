--142
--13.525
--
-- good luck!
local X,Y,Z=x*x,y*y,z*z
-- outer box
if X==9 and Z==9 then
	if Y==9 then return GREY else return WHITE end
elseif X==9 and Y==9 then
	if Z==9 then return GREY else return WHITE end
elseif Y==9 and Z==9 then
	if X==9 then return GREY else return WHITE end
end
-- inner thingy
if X<=4 and y==0 and z==0 then
	if x==0 then return BLUE else return RED end
elseif Y<=4 and x==0 and z==0 and y~=0 then
	return LIGHTGREEN
elseif Z<=4 and x==0 and y==0 and z~=0 then
	return LIGHTBLUE
end
