--293
--28.242

local X,Y,Z=x*x,y*y,z*z
-- excludes a large portion of easy to calc negative space
if X>16 and Y>16 or
	 X>16 and Z>16 or
	 Y>16 and Z>16 then return end

function sdMengerBox(px, py, pz, size, holeWidth)
    -- Distance to the base Cube
    local adx = abs(px) - size
    local ady = abs(py) - size
    local adz = abs(pz) - size
    local dBox = max(adx, ady, adz)

    -- Define the cross-shaped holes (3 intersecting prisms)
    -- hole through X-Y (Z-axis opening)
    local hZ = max(abs(px) - holeWidth, abs(py) - holeWidth)
    -- hole through Y-Z (X-axis opening)
    local hX = max(abs(py) - holeWidth, abs(pz) - holeWidth)
    -- hole through Z-X (Y-axis opening)
    local hY = max(abs(pz) - holeWidth, abs(px) - holeWidth)

    -- subtract the holes from the box
    -- in SDFs, subtracting is, max(shape, -hole)
    local crossHoles = min(hZ, hX, hY)
    
    return max(dBox, -crossHoles)
end

-- NOTE: I really need this
-- "generic repetition formula"
-- local localX = ((x + (W / 2)) % W) - (W / 2)

-- mengerBoxes wrapping over the 9x9x9 crosses 
-- and the entire voxel space
local mengerBoxes=sdMengerBox(
	((x + 4.5) % 9) - 4.5,
	((y + 4.5) % 9) - 4.5,
	((z + 4.5) % 9) - 4.5,
	4.5, 1.5
)
if mengerBoxes<=0 then return end

-- poormans vicsekCrosses everywhere
local xM = abs(x)%3
local XX = xM==2 and 1 or xM
local yM = abs(y)%3
local YY = yM==2 and 1 or yM
local zM = abs(z)%3
local ZZ = zM==2 and 1 or zM
if XX+YY+ZZ <=1 then
	return X<25 and Y<25 and Z<25 and WHITE or GREY
end
