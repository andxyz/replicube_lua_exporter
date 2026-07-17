-- sushi?
r_max = {1,3,9} -- radius_max
c = {7,1,11} -- color
for i = 1,3 do
	if x^2+y^2 < r_max[i] then
		return c[i]
	end
end
-- 37.200
