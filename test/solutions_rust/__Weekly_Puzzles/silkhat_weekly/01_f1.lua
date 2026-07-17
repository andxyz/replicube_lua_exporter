-- f1
-- 71
-- 8.983

if y>4 then return end
local c=x*x+z*z
if y==4 and c<=20 then return BLACK end
if c>=13 then
	if c<=20 and y>-6 then
			if y>=-3 then 
				return BLACK
			else
				return RED
		end
	end
	if y==-6 and c<=41 then return BLACK end
end