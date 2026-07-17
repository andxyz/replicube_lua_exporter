-- Walaber says: Replicube now has 12 languages!
--               Thank you to everyone for playing!
--
-- I reply: Thank you Walaber, this game is so fun.
--        I never thought I could have this much fun
--        all while learning math, voxel shaders, and lua!

--63
--19.508

if x|y==0 then
--print(tonumber("4yo8y".."ytz9g",36))
--print(tonumber( "9pr2h".."ckg".."gkg",36))
print("2/z: ".. 2/z ..", 4/z: ".. 4/z)
end

return
y==-5 and ORANGE or
x==-5 and LIGHTGREEN or
z==-5 and RED or
-- bitshifting two big ol'numbers for the entire grid
tonumber(x<1 and
  "4yo8y".."ytz9g" or 
  "9pr2h".."ckg".."gkg"
,36)
>>29-5*y+x&WHITE==2/z

--504057832079812
--35520789338360800

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

]]--
