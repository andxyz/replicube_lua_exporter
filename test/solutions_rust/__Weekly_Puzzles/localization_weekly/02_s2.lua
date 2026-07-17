-- Walaber says: Replicube now has 12 languages!
--               Thank you to everyone for playing!
--
-- I say: Thank you Walaber, this game is so fun
--        Never thought I could have this much fun
--        all while learning math, voxel shaders, and lua!

--97
--7.839

if y == -5 then return ORANGE end
if x == -5 then return LIGHTGREEN end
if z == -5 then return RED end

-- oneliner bitshift for the entire grid
return z==2 and (x < 1 and 
	tonumber("50".."40".."57".."83".."20".."79".."81".."2") or 
	tonumber("35".."52".."07".."89".."33".."83".."60".."80".."0")
) >>29+x-5*y&1

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
