-- f7
-- 60 
-- 4.723

if y<0 then return end
if y>9 then return end

local y9= y-9
if x>z then
	if z<y9 then return end
	if x>-y9 then return end
	return WHITE
end

if x<y9 then return end
if z>-y9 then return end
return WHITE
