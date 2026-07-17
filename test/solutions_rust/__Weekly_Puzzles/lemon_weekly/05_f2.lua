-- 84
-- 16.164
-- hooray for Lemons!
if x+y > -z then return end
local a= abs(x)
local b= abs(y)
local c= abs(z)
local LizLemon= max(a, b, c, a+b+c-4)
if LizLemon<=6 then
	if LizLemon<=3 then
		if x*y*z==0 then
			return WHITE
		end
		return YELLOW
	end
	if LizLemon==4 then
		return WHITE
	end
	return YELLOW
end