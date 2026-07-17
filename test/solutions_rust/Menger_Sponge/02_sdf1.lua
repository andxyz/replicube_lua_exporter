--177
--107.549
--
-- signed distance function for MengerBox
local function sdMengerBox(px, py, pz, size, holeWidth)
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

-- big box
local mbox0=sdMengerBox(x, y, z, 4.5, 1.5)

-- little boxes everywhere
local mbox1=sdMengerBox(
	ceil(x%3/2), 
	ceil(y%3/2), 
	ceil(z%3/2), 
	1.5, 0.5
)

-- union two SDFs with max()
if max(mbox1,mbox0)<=0 then return y+10 end
--return mbox1<=0 and mbox0<=0 and y+10
