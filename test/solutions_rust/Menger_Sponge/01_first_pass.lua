--118
--30.438
local X,Y,Z=x*x,y*y,z*z
local xx = abs(x)%3
local xxx = xx>=2 and 1 or xx
local yy = abs(y)%3
local yyy = yy>=2 and 1 or yy
local zz = abs(z)%3
local zzz = zz>=2 and 1 or zz
if xxx+yyy+zzz <=1 then
	return 0
end
return 
X<=1 and Y<=1 and 0 or
X<=1 and Z<=1 and 0 or
Y<=1 and Z<=1 and 0 or
y+10
