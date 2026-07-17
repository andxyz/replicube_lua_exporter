-- Walaber says: Replicube now has 12 languages!
--               Thank you to everyone for playing!
--
-- I say: Thank you Walaber, this game is so fun
--        Never thought I could have this much fun
--        all while learning math, voxel shaders, and lua!

--209
--6.154

if y == -5 then return ORANGE end
if x == -5 then return LIGHTGREEN end
if z == -5 then return RED end
if z ~= 2 then return end
-- oneliner bitshift for the entire grid
-- return ((x < 1 and 504057832079812 or 35520789338360800) >> (29 + x - 5 * y)) & 1

-- TIME FOR A MASSIVE x-split bisect tree
if x < 0 then
  -- LEFT SIDE (x = -4, -3, -2, -1)
	if x==-4 then return end
  if y%2 == 0 then return 1 end
	-- remaining odd rows are mostly empty space, two exceptions:
  if y==-3 then return x%2 end
	if y==5 and x==-2 then return 1 end
  -- other rows (y=3, y=1, y=-1) are empty
elseif x > 0 then
  -- RIGHT SIDE (x = 1, 2, 3, 4, 5)
  if y > 0 then
    -- solid rows
    if y==1 or y==5 then return 1 end
    -- partial rows
    if y==3 then if x<5 then return 1 end
    elseif y==4 then if x==2 then return 1 end
    else if x==2 or x==4 then return 1 end end -- y == 2
  else -- y<=0
    -- solid rows
		if y==0 then return end
    if y==-1 or y==-4 then return 1 end
		-- y = -2 and y = -3 share
    if x==1 or x==5 then return 1 end
  end
end

--[[ Original solution:

-- Binary SOLO!!! BEEP BOOP BEEP
local lang_data = {
		{0,0,1,0,0,1,1,1,1,1},
		{0,1,1,1,0,0,1,0,0,0},
		{0,0,0,0,0,1,1,1,1,0},
		{0,1,1,1,0,0,1,0,1,0},
		{0,0,0,0,0,1,1,1,1,1},
		{0,1,1,1,0,0,0,0,0,0},
		{0,0,0,0,0,1,1,1,1,1},
		{0,1,1,1,0,1,0,0,0,1},
		{0,1,0,1,0,1,0,0,0,1},
		{0,1,1,1,0,1,1,1,1,1}
	}
 
if y==-5 then return ORANGE end
if x==-5 then return LIGHTGREEN end
if z==-5 then return RED end
if z==2 and x>=-3 and x~=0 then 
	return lang_data[abs(y-5)+1][x+4] -- btw, lua tables start at 1 not zero
end

-- Arthur likes ice cream!

]]--
