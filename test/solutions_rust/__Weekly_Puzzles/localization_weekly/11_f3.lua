-- Walaber says: Replicube now has 12 languages!
-- Walaber says: Thank you to everyone for playing!
--
-- I say: Thank you Walaber, this game is so fun
-- Never thought I could have this much fun learning math, voxel shaders, and lua!

--209
--6.292

--local lang_data = {
--	{0,1,0,0,1,1,1,1,1},
--	{1,1,1,0,0,1,0,0,0},
--	{0,0,0,0,1,1,1,1,0},
--	{1,1,1,0,0,1,0,1,0},
--	{0,0,0,0,1,1,1,1,1},
--	{1,1,1,0,0,0,0,0,0},
--	{0,0,0,0,1,1,1,1,1},
--	{1,1,1,0,1,0,0,0,1},
--	{1,0,1,0,1,0,0,0,1},
--	{1,1,1,0,1,1,1,1,1}
--}

if y == -5 then return ORANGE end
if x == -5 then return LIGHTGREEN end
if z == -5 then return RED end
-- early exit
if z ~= 2 then return end

-- Bit packing with a bitmask revisited, as as a per level number.
-- The commented out lua table 
-- both the creation of the table inside main voxel loop 
-- and later doing the actual lookups, is in efficient for speed
-- So... down below we turned my "nice" bitpacking code... into a HorribleHorrible
-- inline, magic numbers, optimized branch strategy
--
-- local M_ROWS = {
-- 	503, -- y = -4
-- 	277, -- y = -3
-- 	279, -- y = -2
-- 	496, -- y = -1
-- 	7,   -- y = 0
-- 	496, -- y = 1
-- 	167, -- y = 2
-- 	240, -- y = 3
-- 	39,  -- y = 4
-- 	498  -- y = 5
-- }

-- BISECT TREE, bigO(log N) branching
-- Splits y checks: max 3-4 jumps per voxel
if y > 0 then	
  if y > 2 then
    if y == 5 then return (498 >> (x + 3)) & 1 end
    if y == 4 then return (39 >> (x + 3)) & 1 end
    return (240 >> (x + 3)) & 1 -- y = 3
  else
    if y == 2 then return (167 >> (x + 3)) & 1 end
    return (496 >> (x + 3)) & 1 -- y = 1
  end
else
  if y > -2 then
    if y == 0 then return (7 >> (x + 3)) & 1 end
    return (496 >> (x + 3)) & 1 -- y = -1
  else
    if y == -2 then return (279 >> (x + 3)) & 1 end
    if y == -3 then return (277 >> (x + 3)) & 1 end
    return (503 >> (x + 3)) & 1 -- y = -4
  end
end

--[[ Original solution:

-- Binary SOLO!!! BEEP BOOP BEEP
local lang_data = {
		{0,1,0,0,1,1,1,1,1},
		{1,1,1,0,0,1,0,0,0},
		{0,0,0,0,1,1,1,1,0},
		{1,1,1,0,0,1,0,1,0},
		{0,0,0,0,1,1,1,1,1},
		{1,1,1,0,0,0,0,0,0},
		{0,0,0,0,1,1,1,1,1},
		{1,1,1,0,1,0,0,0,1},
		{1,0,1,0,1,0,0,0,1},
		{1,1,1,0,1,1,1,1,1}
	}
 
if y==-5 then return ORANGE end
if x==-5 then return LIGHTGREEN end
if z==-5 then return RED end
if z==2 and x>=-3 and x~=0 then 
	return lang_data[abs(y-5)+1][x+4] -- btw, lua tables start at 1 not zero
end

-- Arthur likes ice cream!

]]--
