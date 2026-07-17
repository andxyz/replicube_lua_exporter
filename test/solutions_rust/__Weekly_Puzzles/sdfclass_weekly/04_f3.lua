-- 247
-- 116.052

-- My version of making the sdf code "fast"

-- btw, if you squint really hard you can notice the demo had it all!
--return
--demoHelper("subtraction_plus_reversal_subtraction", a, b, color1, color2) or
--demoHelper("outer_union", a, b, nil, PEACH)

local function sdMengerBox(px, py, pz, size, holeWidth)
  local apx = abs(px)
  local apy = abs(py)
  local apz = abs(pz)	
  return max(
					max(apx - size, apy - size, apz - size), 
					-min(
						max(apx - holeWidth, apy - holeWidth), 
						max(apy - holeWidth, apz - holeWidth), 
						max(apz - holeWidth, apx - holeWidth)
					)
				)
end

local a = sdMengerBox(x, y, z, 9/2, 3/2)
local b = sdMengerBox(
	((x + 3/2) % 3) - 3/2,
	((y + 3/2) % 3) - 3/2,
	((z + 3/2) % 3) - 3/2,
	3/2, 1/2
)

return
max(-b,a)<=0 and y+10 or
max(-a,b)<=0 and ({7,6, 11,10,9, 14,13})[y+4] or
min(a,b)>0 and PEACH

--[[

-- If we simplify the code from the original as much as we can before refactoring
-- it looks something like the following:

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
local a = sdMengerBox(x, y, z, 9/2, 3/2)
local b = sdMengerBox(
	((x + 3/2) % 3) - 3/2,
	((y + 3/2) % 3) - 3/2,
	((z + 3/2) % 3) - 3/2,
	3/2, 1/2
)

local original_color_wheel = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}
local counter_part_color_wheel = {1,2,3,4,5, 8,7,6, 11,10,9, 14,13,12, 16,15}
local our_periodic_number = (y+3)%7+7
local color1 = original_color_wheel[our_periodic_number]
local color2 = counter_part_color_wheel[our_periodic_number]

return 
max(-b,a)<=0 and color1 or 
max(-a,b)<=0 and color2 or 
min(a,b)>=0 and PEACH

]]--
