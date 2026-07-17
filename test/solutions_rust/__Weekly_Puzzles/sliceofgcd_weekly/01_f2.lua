--66
--5.637
if t~=z+8 then return end

local a= x-y
local b= z-y
while b ~= 0 do
	a,b= b,a%b
end
b= t
while b ~= 0 do
	a,b= b,a%b
end
if a>0 then return a else return -a end
