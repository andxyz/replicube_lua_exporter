-- f4
-- 78
-- 4.983
if y<0 then return end
if y>9 then return end
 
if x>=0 then
	if x+y<10 then
		if z>=0 then return z+y<10 else return -z+y<10 end
	end
else
	if -x+y<10 then
		if z>=0 then return z+y<10 else return -z+y<10 end
	end
end
