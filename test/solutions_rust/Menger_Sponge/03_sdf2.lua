--200
--88.067
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

-- big menger box
local mbox0=sdMengerBox(x, y, z, 4.5, 1.5)
if mbox0>0 then -- we are outside the big box shape
	return -- leave early
end

-- NOTE: I really need this
-- "generic repetition formula"
-- local localX = ((x + (W / 2)) % W) - (W / 2)

-- little menger boxes everywhere
local mbox1=sdMengerBox(
	((x + 3/2) % 3) - 3/2,
	((y + 3/2) % 3) - 3/2,
	((z + 3/2) % 3) - 3/2,
	3/2, 1/2
)
if mbox1<=0 then -- we are inside a little box
	return y+10
end