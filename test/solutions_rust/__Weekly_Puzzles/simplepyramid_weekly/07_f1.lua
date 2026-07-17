-- f1
-- 87
-- 5.690
if y>9 then return end
if y<0 then return end

if x>0 then
	if z>0 then
		return x+y<10 and z+y<10
	else
		return x+y<10 and -z+y<10
	end
else
	if z>0 then
		return -x+y<10 and z+y<10
	else
		return -x+y<10 and -z+y<10
	end
end
