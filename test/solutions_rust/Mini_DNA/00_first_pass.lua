--107
--9.187
local X,Z=x*x,z*z
local XZ=X+Z
if XZ>2 or XZ==0 then return end -- empty space
local Y=y*y
if Y==9 and XZ<=2 then return WHITE end
if Z==1 and x*sign(z)-1==y then return 7+7*btoi(z<0) end
if X==1 and z*sign(x)-1==-y then return 7+7*btoi(x<0) end
