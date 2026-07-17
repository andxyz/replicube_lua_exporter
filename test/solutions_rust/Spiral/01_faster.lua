-- remember max() is useful for
-- making frames / box shapes

if z*z>4 then return end

if y>=0 then
	local a = max(abs(x),y)
	return a%2==1 and z+8
else
	local b = max(abs(x-1),-y)
	return b%2==0 and z+8
end
