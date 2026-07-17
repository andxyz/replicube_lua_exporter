-- first_pass
-- 72
-- 9.076

if y>4 then return end
local c=x*x+z*z
if y==4 and c<=20 then return BLACK end
if y>-6 then
	if c>=13 and c<=20 then
		if y>=-3 then 
			return BLACK
		else
			return RED
		end
	end
	return
end
if c>=13 and c<=41 then return BLACK end