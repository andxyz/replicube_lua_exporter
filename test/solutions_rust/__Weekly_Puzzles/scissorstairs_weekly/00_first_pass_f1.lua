--f1
--119
--6.799
local X,Z=x*x,z*z
local XZ=X+Z
if XZ>=9 or XZ<=3 then return end -- empty space
if X==4 and y%4==0 then -- bars
	return BLUE+btoi(x<0 and y%4==y%8 or x>0 and y%4~=y%8)
end
if Z==4 and (x*sign(z))%4==(y-2)%4 then -- connectors
	return BLUE+btoi(z>0 and y%4==y%8 or z<0 and y%4~=y%8)
end
