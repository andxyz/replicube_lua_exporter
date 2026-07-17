-- exclude empty space
if x|z>0 or y^2>=16 then return end

local mx = max(x*x,z*z)
if y==-2 and (mx==9 or mx==16 or mx == 25 or mx==36 or mx == 49) then return end
if y==-1 and (mx==9 or mx == 49) then return end
if y==0 and (mx==9 or mx == 25 or mx == 49) then return end
if y==1 and (mx==9 or mx==16 or mx == 25 or mx == 49) then return end
if y==2 and (mx == 49) then return end
if y ==3 and (mx <= 49) then return end

function fastSquareTorus(x, y, z, innerR, thickness, height)
    local d2d = abs(max(abs(x) - innerR, abs(y) - innerR)) - thickness
    return max(d2d, abs(z) - height)
end

local innerRadius = 5
local thickness = 3
local height = 4

-- Threshold check (0 or less is "inside" the shape)
if fastSquareTorus(x, z, y, innerRadius, thickness, height) <= 0 then
	return YELLOW -- Solid Voxel
else
	return -- Empty Voxel
end

