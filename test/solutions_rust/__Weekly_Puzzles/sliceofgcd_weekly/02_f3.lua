--56
--5.582
if t~=z+8 then return end

local a= x+8
local b= y+8
while b ~= 0 do
	a,b= b,a%b
end
b= t
while b ~= 0 do
	a,b= b,a%b
end
return a
