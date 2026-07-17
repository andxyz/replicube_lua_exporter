--67
--9.956
local X,Y,Z=x%4,y%4,z%4
if X==0 and Y==0 and Z==0 then return WHITE
elseif X==0 and Z==0 then return LIGHTGREEN
elseif X==0 and Y==0 then return LIGHTBLUE
elseif Y==0 and Z==0 then return RED end
