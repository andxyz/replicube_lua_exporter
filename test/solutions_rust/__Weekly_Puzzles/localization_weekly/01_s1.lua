-- Replicube now has 12 languages!
-- Thank you to everyone for playing!

--101
--7.0129

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

if z == 2 and x>=-3 then
 return
	(y > 0 and 
		tointeger("34".."10".."73".."37".."75".."66".."58") or 
		tointeger("34".."60".."31".."48".."50".."09".."99"))
	>>((5-y)%5)*9+x+3&1
end
