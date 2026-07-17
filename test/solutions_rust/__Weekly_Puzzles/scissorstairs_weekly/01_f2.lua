--f2
--127
--6.627
local X,Z=x*x,z*z
local XZ=X+Z
if XZ>=9 then return end -- empty space

if X==4 then -- bars
	if y%4==0 then
		if x<0 then
			return BLUE+btoi(y%4==y%8)
		else 
			return BLUE+btoi(y%4~=y%8) 
		end
	end
	return
end

if Z==4 then -- connectors
	if (x*sign(z))%4==(y-2)%4 then 
		if z>0 then
			return BLUE+btoi(y%4==y%8)
		else
			return BLUE+btoi(y%4~=y%8)
		end
	end
	return
end
