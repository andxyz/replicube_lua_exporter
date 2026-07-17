-- f6
-- 46 
-- 4.682

if y<0 then return end
if y>9 then return end
local y9= y-9
if x>=y9 and z>=y9 then
	y9= -y9
	if x<=y9 and z<=y9 then
		return WHITE
	end
end
