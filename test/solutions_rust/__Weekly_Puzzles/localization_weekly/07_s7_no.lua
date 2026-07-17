-- Walaber says: Replicube now has 12 languages!
--               Thank you to everyone for playing!
--
-- I reply: Thank you Walaber, this game is so fun.
--        I never thought I could have this much fun
--        all while learning math, voxel shaders, and lua!

--68
--19.508

return
y==-5 and ORANGE or
x==-5 and LIGHTGREEN or
z==-5 and RED or
-- returning 2 or 0
tonumber(x<1 and 
	"9xchn".."b2f4s" or
	"jfi4y".."oux".."oe8"
	,36)
>>(x-1)%5+5*(y%11)&2==4/z

--1008115021541404
--71041578659960768

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
