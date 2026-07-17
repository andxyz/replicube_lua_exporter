-- look at this CUTE little duck!
-- I tried making it with the minimum amount of
-- voxels that still communicated 'duck'
if abs(x) == 1 and (y == -1 or y == -2) and z == -1 then
	return ORANGE
end

if (z > -3 and z < 2) then
	if x == 0 and y > -1 and z == 1 then
		return GREEN
	elseif abs(x) < 2 and y == 0 or x == 0 and (y > -1 and y < 2) then
		return BROWN
	elseif x == 0 and y == -1 then
		return GREY
	end
end

return x == 0 and y == 2 and z == 2 and YELLOW