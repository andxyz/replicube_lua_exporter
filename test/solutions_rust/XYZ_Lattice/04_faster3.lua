--61
--8.724
local X,Y,Z=x%4,y%4,z%4
if X==0 and Z==0 then
	if Y==0 then return WHITE else return LIGHTGREEN end
elseif X==0 and Y==0 then 
	return LIGHTBLUE
elseif Y==0 and Z==0 then 
	return RED
end
