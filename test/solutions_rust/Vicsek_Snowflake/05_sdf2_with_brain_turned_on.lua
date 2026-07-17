--296
--35.421
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

-- Signed Distance Function for VicsekCross
--
-- I am so silly! sdVicsekCross() is simply the inner part of a mengerBox!
-- I dont need this function at all!
--function sdVicsekCross(px, py, pz, size)
--  local apx, apy, apz = abs(px), abs(py), abs(pz)
--  
--  -- 1. The Central Cube
--  -- box where all sides are equal to 'size'
--  local center = max(apx, apy, apz) - size
--  
--  -- 2. The 3 Axis Bars (The "Arms")
--  -- Each bar is long on one axis (size * 3) and thin on others (size)
--  local armLength = size * 3
--	
--  -- X-axis bar: thin on Y and Z
--  local barX = max(apx - armLength, apy - size, apz - size)
--  -- Y-axis bar: thin on X and Z
--  local barY = max(apy - armLength, apx - size, apz - size)
--  -- Z-axis bar: thin on X and Y
--  local barZ = max(apz - armLength, apx - size, apy - size)
--  
--  -- 3. Union all parts together
--  -- min(A, B) merges the volumes
--  return min(center, barX, barY, barZ)
--end

-- setup sdf holders
-- useful if you need to comment something out to get a better view
--local sdf0,sdf1,sdf2=1,1,0

-- big outer mengerBox
-- dont need anymore thanks to "Empty Space Cheat:" above
--local sdf0=sdMengerBox(x, y, z, 13.5, 4.5)

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


-- tiny menger boxes 3x3x3 (we will use the inversion to create the crosses)
local sdf2=sdMengerBox(
	((x + 3/2) % 3) - 3/2,
	((y + 3/2) % 3) - 3/2,
	((z + 3/2) % 3) - 3/2,
	3/2, 1/2
)

if sdf1<=0 then return end
if sdf2>0 then
	if X<25 and Y<25 and Z<25 then
		return WHITE
	end
	return GREY
end
