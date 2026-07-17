--200
--11.602
-- exclude empty space
if x|z>0 or y^2>=16 then return end

-- exclude inner hollow of spirals
local mx = max(x*x,z*z)
if y==-3 and mx >= 4 then return YELLOW -- hardcode bottom to avoid spiral math
elseif y==-2 and (mx==9 or mx==16 or mx == 25 or mx==36 or mx == 49) then return
elseif y==-1 and (mx==9 or mx == 49) then return
elseif y==0 and (mx==9 or mx == 25 or mx == 49) then return
elseif y==1 and (mx==9 or mx==16 or mx == 25 or mx == 49) then return
elseif y==2 and (mx == 49) then return
elseif y ==3 and (mx <= 49) then return
elseif y ==3 and (mx == 64) then return YELLOW end -- hardcode top to avoid spiral math

-- Removing the function and doing everything "inline"
-- Threshold check (0 or less is "inside" the shape)
if max(abs(max(abs(x) - 5, abs(z) - 5)) - 3, abs(y) - 4) <= 0 then
	return YELLOW -- Solid Voxel
end

--
--function fastSquareTorus(x, y, z, innerR, thickness, height)
--    local d2d = abs(max(abs(x) - innerR, abs(y) - innerR)) - thickness
--    return max(d2d, abs(z) - height)
--end
--
--local innerRadius = 5
--local thickness = 3
--local height = 4
--
---- Threshold check (0 or less is "inside" the shape)
--if fastSquareTorus(x, z, y, innerRadius, thickness, height) <= 0 then
--	return YELLOW -- Solid Voxel
--else
--	return -- Empty Voxel
--end
