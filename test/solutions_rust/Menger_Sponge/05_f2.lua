--89
--20.141
local X,Y,Z=x*x,y*y,z*z
if
X<=1 and Y<=1 or
X<=1 and Z<=1 or
Y<=1 and Z<=1 then return end
--if y==0 and z==2 then
--	print("abs(x)%3/2: ".. abs(x)%3/2 .." ceil(x%3/2):".. ceil(x%3/2)) 
--end
local xxx = ceil(x%3/2)
local yyy = ceil(y%3/2)
local zzz = ceil(z%3/2)
if xxx+yyy+zzz >1 then
	return y+10
end
