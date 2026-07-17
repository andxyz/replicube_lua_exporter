-- 74
-- 19.369
if x+y > -(z) then return end
--if x+y < -(z+10) then return end

local LizLemon = max(abs(x), abs(y), abs(z), abs(x)+abs(y)+abs(z)-4)

if LizLemon<=6 then
	if LizLemon<4 then
		if x*y*z==0 then return WHITE end
	elseif LizLemon==4 then 
		return WHITE
	end
	return YELLOW
end
