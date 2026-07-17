--121
--34.890
local s1=0
local s2=0
local s3=0
if y>=0 then
	s1 = max(abs(x),y)%2
else
	s1 = 1-max(abs(x-1),-y)%2
end
if z>=0 then
	s2 = max(abs(y),z)%2
	s3 = max(abs(x),z)%2
else
	s2 = 1-max(abs(y-1),-z)%2
	s3 = 1-max(abs(x-1),-z)%2
end
return s1~=0 and s2~=0 and s3~=0 and YELLOW
