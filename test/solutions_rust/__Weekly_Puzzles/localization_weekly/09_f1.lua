-- Replicube now has 12 languages!
-- Thank you to everyone for playing!

--4170
--7.922

--local lang_data = {
--		{0,1,0,0,1,1,1,1,1},
--		{1,1,1,0,0,1,0,0,0},
--		{0,0,0,0,1,1,1,1,0},
--		{1,1,1,0,0,1,0,1,0},
--		{0,0,0,0,1,1,1,1,1},
--		{1,1,1,0,0,0,0,0,0},
--		{0,0,0,0,1,1,1,1,1},
--		{1,1,1,0,1,0,0,0,1},
--		{1,0,1,0,1,0,0,0,1},
--		{1,1,1,0,1,1,1,1,1}
--	}

if y == -5 then return ORANGE end
if x == -5 then return LIGHTGREEN end
if z == -5 then return RED end

-- precomputed magic numbers packing the lang_data
-- M1 packs rows 1-5
-- M2 packs rows 6-10
local M1, M2 = 34107337756658, 34603148500999

if z == 2 then
	if x >= -3 and x ~= 0 then
		if y > 0 then
  		return M1 >> (((5 - y) % 5) * 9 + x + 3) & 1
		else
			return M2 >> (((5 - y) % 5) * 9 + x + 3) & 1
		end
	end
end
