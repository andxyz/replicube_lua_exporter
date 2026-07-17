-- 17.790 is my fastest
-- 104
-- 17.790
local X,Y,Z=x*x,y*y,z*z
--local inner_test = X<=1 and Y<=1 or X<=1 and Z<=1 or Y<=1 and Z<=1
--local mengerish = X%3 + Y%3 + Z%3 > 1
if X<=1 and Y<=1 or X<=1 and Z<=1 or Y<=1 and Z<=1 then
  if X%3 + Y%3 + Z%3 > 1 then
		return ({7,6, 11,10,9, 14,13})[y+4]
	else return PEACH end
else
	if X%3 + Y%3 + Z%3 <= 1 then
		return y+10
	end
end

-- NOTE: if you squinted really hard,
-- notice the demo code had it all (heh heh)
-- So there is no _need_ to learn math if you are clever... 
-- or is being clever using math but not knowing?
--
--return
--demoHelper("subtraction_plus_reversal_subtraction", a, b, color1, color2) or
--demoHelper("outer_union", a, b, nil, PEACH)

--[[

-- An attempt at making the signed distance function code "fast", 
-- while maintaining the "shape" of the original concept

-- 162
-- 80.321
local function sdMengerBox(px, py, pz, holeWidth)
  return holeWidth-min(max(px, py), max(py, pz), max(pz, px))
end

-- infinite repetition https://iquilezles.org/articles/sdfrepetition/
local a = sdMengerBox(abs(x), abs(y), abs(z), 3/2)
local b = sdMengerBox(
	abs(((x + 3/2) % 3) - 3/2), 
	abs(((y + 3/2) % 3) - 3/2), 
	abs(((z + 3/2) % 3) - 3/2), 
	1/2
)

return
max(-b,a)<=0 and y+10 or
max(-a,b)<=0 and ({7,6, 11,10,9, 14,13})[y+4] or
min(a,b)>0 and PEACH
]]--

--[[

-- If we simplify the code from the original as much as we can before refactoring
-- it looked something like the following:

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

-- btw, 17.790 is my fastest
-- btw, 87 is my smallest