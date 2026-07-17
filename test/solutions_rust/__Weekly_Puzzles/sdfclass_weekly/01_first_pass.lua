-- The Motorola 68800
-- 178.544

--[[
	The Menger Sponge! Wait, it looks a little different?
	
	We are zoomed in here, so we can not see too much of the "Menger Sponge"
	but, that is ok!
	It makes things easier to work with when our working area is smaller.
	
	Some understanding of "signed distance functions" 
  may help, thanks to https://iquilezles.org/articles/distfunctions/
]]--

--[[
	1. Okay, first things first
	
	We setup a signed distance function (sdf) 
	this will help us to create our mini menger boxes.
	Together, we can use the "sdMengerBox" function to make 
	a bunch of boxes and then combine	them in interesting ways.
]]--

-- "signed distance function" for "MengerBox" (let us keep this function handy)
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
-- this a helper function, we need it later to demo some things
local function demoHelper(demo_name,a,b,color1,color2)
  --## Subtraction examples:
  if demo_name=="subtraction_2" then return max(-a,b)<=0 and color1 end
	if demo_name=="outer_subtraction_2" then return max(-b,a)>0 and color2 end
  --## Union examples
	if demo_name=="union" then return min(a,b)<=0 and color1 end
	if demo_name=="outer_union" then return min(a,b)>0 and color2 end
  --## Intersection examples:
	if demo_name=="intersection" then return max(a,b)<=0 and color1 end
	if demo_name=="outer_intersection" then return max(a,b)>0 and color2 end
  --## Some other examples I enjoyed:
	 if demo_name=="wacky_subtraction_1" then return max(-a,b)>0 and color2 end
  --## Fun with "multiple combinations"
  --## You can keep on combining shapes together!
  --## I enjoyed "xor + outer union":
  if demo_name=="xor_plus_outer_union" then
    if max(min(a,b),-max(a,b))<=0 then
    	return color1
    elseif min(a,b)>0 then
    	return color2
		else 
			return 0
    end
  end
  --## this one I call "Subtraction + reversal Subtraction":
	if demo_name=="subtraction_plus_reversal_subtraction" then return max(-b,a)<=0 and color1 or max(-a,b)<=0 and color2 end
	
	return BROWN -- debug color incase our helper goes wrong somehow
end

--[[
	2. Okay, second things second
	
	We will setup two variables: "a=" and "b="
	These will be our two "shapes".
	
	We can combine our "shapes" in simple ways with
	a little bit of math, all thanks to our signed distance function above.
]]--

-- a, the big box:
--
-- Remember: above we have "sdMengerBox(px, py, pz, size, holeWidth)"
-- Note: all sizes are "half-sizes", so we divide by 2.
local a = sdMengerBox(x, y, z, 9/2, 3/2)

-- b, little boxes everywhere:
--
-- Remember: sdMengerBox(px, py, pz, size, holeWidth)
-- Note: we use mod() math here with our sdf to make 
--       a bunch of repeating mini menger boxes
local b = sdMengerBox(
	((x + 3/2) % 3) - 3/2,
	((y + 3/2) % 3) - 3/2,
	((z + 3/2) % 3) - 3/2,
	3/2, 1/2
)

-- 3. Time to get really elaborate!
--
-- Now we setup a custom colorwheel to be a subset of the 16 colors
-- with "counter_part_colors" chosen for some symmetry
--
-- The colors we will end up working with are: 6,7,9,10,11,13,14
-- starting at purple and ending over in the blues
local original_color_wheel = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}
local counter_part_color_wheel = {1,2,3,4,5, 8,7,6, 11,10,9, 14,13,12, 16,15}

-- The following periodic number changes with "y"
-- hopefully it stays between 7 and 13
-- I hope it doesnt run away on us (heh heh)
local our_periodic_number = (y+3)%7+7 
if t==0 and x==0 and z==0 then print(our_periodic_number) end

-- Using our periodic number and our custom color wheels
-- we can setup two colors that change with y
local color1 = original_color_wheel[our_periodic_number]
local color2 = counter_part_color_wheel[our_periodic_number]

--[[ 
	4. Okay! time for the fun part (heh heh)

	Now we go looking for a fun "mengerspongey-ishy shape" 
	using Primitive combinations with our "sdfs", "a" and "b"

	Primitive combinations for two shapes using signed distance functions:
  	operation Union:        min(a,b)
  	operation Subtraction:  max(-a,b)
  	operation Intersection: max(a,b)
  	operation Xor:          max(min(a,b),-max(a,b))

	For more visual examples of "primitive combinations" using "a" and "b"
  Comment and Uncomment the "return" statements below to see new shapes!
	
	Note: make sure to only have one "return" statement uncommented
]]--

--## Our very first example at t==0 is "basic subtraction":

return
demoHelper("subtraction_plus_reversal_subtraction", a, b, color1, color2) or
demoHelper("outer_union", a, b, nil, PEACH)

--[[
	btw, Did you want to have a look at the shapes "a" and "b"?
	
	Note: because we repeated the sdf shape using mod() math above
	for "b" we must do more mod() math to "reveal it" nicely
]]-- 

--## Have a look at shape "a" (one big 9x9x9 mengercube)
--return a<=0 and PEACH

--## Have a look at shape "b" (3x3x3 mengercubes)
--return b<=0 and (x-2)//3 + (y-2)//3 + (z-2)//3 + 12
