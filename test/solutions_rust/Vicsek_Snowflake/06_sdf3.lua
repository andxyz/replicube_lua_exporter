--300
--25.624
local X,Y,Z=x*x,y*y,z*z

-- Empty Space Cheat: excludes a large portion of easy to calc negative space
if X>16 and Y>16 or
	 X>16 and Z>16 or
	 Y>16 and Z>16 then return end

-- signed distance function for MengerBox
function sdMengerBox(px, py, pz, size, holeWidth)
    -- Distance to the base Cube
		local apx = abs(px)
		local apy = abs(py)
		local apz = abs(pz)	
    local adx = apx - size
    local ady = apy - size
    local adz = apz - size
    local dBox = max(adx, ady, adz)

    -- Define the cross-shaped holes (3 intersecting prisms)
    -- hole through X-Y (Z-axis opening)
    local hZ = max(apx - holeWidth, apy - holeWidth)
    -- hole through Y-Z (X-axis opening)
    local hX = max(apy - holeWidth, apz - holeWidth)
    -- hole through Z-X (Y-axis opening)
    local hY = max(apz - holeWidth, apx - holeWidth)

    -- Union all the holes with min()
    local crossHoles = min(hZ, hX, hY)
    -- in SDFs, subtracting is, max(shape, -otherShape)
    return max(dBox, -crossHoles)
end

-- NOTE: I really need this
-- "generic repetition formula"
-- local localX = ((x + (W / 2)) % W) - (W / 2)

-- Mid-size mengerBoxes 9x9x9 wrapping over the crosses 
-- and the entire voxel space
local sdf1=sdMengerBox(
	((x + 9/2) % 9) - 9/2,
	((y + 9/2) % 9) - 9/2,
	((z + 9/2) % 9) - 9/2,
	9/2, 3/2
)

if sdf1<=0 then return end

-- tiny menger boxes 3x3x3 (we will use the inversion to create the crosses)
local sdf2=sdMengerBox(
	((x + 3/2) % 3) - 3/2,
	((y + 3/2) % 3) - 3/2,
	((z + 3/2) % 3) - 3/2,
	3/2, 1/2
)
if sdf2>0 then
	if X<25 and Y<25 and Z<25 then
		return WHITE
	else
		return GREY
	end
end
