-- good luck!
local X,Y,Z=x*x,y*y,z*z
if x==0 and y==0 and z==0 then return BLUE end
if X<=4 and y==0 and z==0 then return RED end
if Y<=4 and x==0 and z==0 then return LIGHTGREEN end
if Z<=4 and x==0 and y==0 then return LIGHTBLUE end
if X==9 and Z==9 and Y==9 then return GREY end
if X==9 and Z==9 then return WHITE end
if X==9 and Y==9 then return WHITE end
if Y==9 and Z==9 then return WHITE end
