-- Walaber says: Replicube now has 12 languages!
--               Thank you to everyone for playing!
--
-- I say: Thank you Walaber, this game is so fun
--        Never thought I could have this much fun
--        all while learning math, voxel shaders, and lua!

-- 199
-- 6.186

if y == -5 then return ORANGE end
if x == -5 then return LIGHTGREEN end
if z == -5 then return RED end
if z ~= 2 then return end

-- TIME FOR A MASSIVE y-split bisect tree
if y >= 0 then
  if x < 0 then
    -- TOP LEFT (x = -4, -3, -2, -1)
    if x == -4 then return end
    if y % 2 == 0 then return 1 end
    if y == 5 and x == -2 then return 1 end
  elseif x > 0 then
    -- TOP RIGHT (x = 1, 2, 3, 4, 5)
    if y == 0 then return end
    if y == 1 or y == 5 then return 1 end
    if y == 3 then
      if x < 5 then return 1 end
    elseif y == 4 then
      if x == 2 then return 1 end
    else
      if x == 2 or x == 4 then return 1 end
    end
  end
else -- y < 0
  if x < 0 then
    -- BOTTOM LEFT (x = -4, -3, -2, -1)
    if x == -4 then return end
    if y % 2 == 0 then return 1 end
    if y == -3 then return x % 2 end
  elseif x > 0 then
    -- BOTTOM RIGHT (x = 1, 2, 3, 4, 5)
    if y == -1 or y == -4 then return 1 end
    if x == 1 or x == 5 then return 1 end
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
