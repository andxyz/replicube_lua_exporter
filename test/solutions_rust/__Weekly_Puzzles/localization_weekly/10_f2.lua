-- Replicube now has 12 languages!
-- Thank you to everyone for playing!

--4174
--6.352

--[[
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
]]--

if y == -5 then return ORANGE end
if x == -5 then return LIGHTGREEN end
if z == -5 then return RED end

if z == 2 then
	if x >= -3 then
  	-- precomputed magic numbers packing the lang_data
  	-- M1 packs rows 1-5
  	-- M2 packs rows 6-10
  	local M1 = 34107337756658
  	local M2 = 34603148500999
  	if y > 0 then
  	  return M1 >> (48 + x - 9 * y) & 1
  	else
  	  return M2 >> (3 + x - 9 * y) & 1
  	end
	else 
		return 
	end
end
