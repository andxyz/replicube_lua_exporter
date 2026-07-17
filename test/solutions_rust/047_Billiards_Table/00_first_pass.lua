-- REALLY QUITE HEAVY WHEN MADE
-- SOLID LIKE THIS

-- empty space
if y>3 then return end

local X=x^2
local Z=z^2
if y<0 then -- legs
	if X>=4 and X<=9 and Z>=16 and Z<=25 then
		return BLACK
	else
		return
	end	
elseif X<=25 then -- tabletop
	if y==3 and X<=16 and Z<=36 then
		if X<=9 and Z<=25 then return end
		return GREEN
	elseif y==2 and X<=9 and Z<=25 then
		if z%5==0 and X==9 then return 0 end
		return GREEN
	end
	return DARKBROWN
end
