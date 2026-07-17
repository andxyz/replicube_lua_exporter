--405
--163.351
GOTIME=0
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
-- signed distance function for VicsekCross
function sdVicsekCross(px, py, pz, size)
  local apx, apy, apz = abs(px), abs(py), abs(pz)
  
  -- 1. The Central Cube
  -- box where all sides are equal to 'size'
  local center = max(apx, apy, apz) - size
  
  -- 2. The 3 Axis Bars (The "Arms")
  -- Each bar is long on one axis (size * 3) and thin on others (size)
  local armLength = size * 3
	
  -- X-axis bar: thin on Y and Z
  local barX = max(apx - armLength, apy - size, apz - size)
  -- Y-axis bar: thin on X and Z
  local barY = max(apy - armLength, apx - size, apz - size)
  -- Z-axis bar: thin on X and Y
  local barZ = max(apz - armLength, apx - size, apy - size)
  
  -- 3. Union all parts together
  -- min(A, B) merges the volumes
  return min(center, barX, barY, barZ)
end

-- setup sdf holders
-- useful if you need to comment something out to get a view
local sdf0,sdf1,sdf2=1,1,1

-- big outer mengerBox
local sdf0=sdMengerBox(x, y, z, 13.5, 4.5)

-- NOTE: I really need this
-- "generic repetition formula"
-- local localX = ((x + (W / 2)) % W) - (W / 2)

-- Tiny mengerBoxes wrapping over the crosses 
-- and the entire voxel space
local sdf1=sdMengerBox(
	((x + 4.5) % 9) - 4.5,
	((y + 4.5) % 9) - 4.5,
	((z + 4.5) % 9) - 4.5,
	4.5, 1.5
)

-- vicsek crosses everywhere!!!
local sdf2 = sdVicsekCross(
	((x + 3/2) % 3) - 3/2,
 	((y + 3/2) % 3) - 3/2,
	((z + 3/2) % 3) - 3/2,
	0.5
)

if GOTIME==1 then PURPLE,PEACH=0,0 end
return
	sdf0<=0 and PURPLE or
	sdf1<=0 and PEACH or
	sdf2<=0 and 
	(x*x<25 and y*y<25 and z*z<25
		and WHITE or GREY)
