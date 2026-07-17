--74
--29.001
local X,Y,Z=abs(x),abs(y),abs(z)
return
min(-Y,-Z)+x >=1 and RED or
min(-X,-Z)+y >=1 and YELLOW or
min(-X,-Y)+z >=1 and GREEN or
x==0 and y==0 and z==0 and BLACK
