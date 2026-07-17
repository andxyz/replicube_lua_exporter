-- Replicube now has 12 languages!
-- Thank you to everyone for playing!

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
if z~=2 then return end
 
return lang_data[abs(y-5)+1][x+4]

-- Arthur likes ice cream!
