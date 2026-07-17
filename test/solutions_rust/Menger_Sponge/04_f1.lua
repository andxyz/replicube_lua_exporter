--115
--25.370
local X,Y,Z=x*x,y*y,z*z
if
X<=1 and Y<=1 or
X<=1 and Z<=1 or
Y<=1 and Z<=1 then return end
local xx = abs(x)%3
local xxx = xx>=2 and 1 or xx
local yy = abs(y)%3
local yyy = yy>=2 and 1 or yy
local zz = abs(z)%3
local zzz = zz>=2 and 1 or zz
if xxx+yyy+zzz <=1 then
	return 0
end
return y+10
