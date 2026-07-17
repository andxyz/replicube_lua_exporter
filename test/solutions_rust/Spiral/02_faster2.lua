-- 53
-- 8.521
if z>2 or z<-2 then return end
if y>=0 then
	return max(abs(x),y)%2==1 and z+8
else
	return max(abs(x-1),-y)%2==0 and z+8
end
