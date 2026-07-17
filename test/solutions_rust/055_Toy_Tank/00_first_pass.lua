-- OK get this idea: essentially a tacital
-- turn-based RPG, but instead of the standard
-- fantasy setting, it's a WW2-era military 
-- battle!

-- barrel
local Z = z^2
if Z + (y-4)^2 < 3 then 
	if x > -2 then return GREEN
	elseif x < -3 then return end
end
-- body and tread
if x^2/25 + y^2/11 <= 1 then
	if Z <= 16 then 
		return y > -2 and GREEN 
	end
	return BLACK
end
