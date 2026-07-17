--225
--8.928
-- This is a rare one that isn't based
-- on a game idea.

-- I just really like the somewhat forgotten
-- 3DO console.  It had a really cool design
-- and was also the console that Crystal
-- Dynamics got it's start on.

if y>=3 or y<=-3 then return -- get out early
else
	-- check interior escape hatches
	local X,Z=x^2,z^2
	if (X<=9 and Z==36 or Z<=9 and X==36) then return end -- xbox reliefs
	-- focus on interior
	if max(X,Z)<=16 then 
		if y==1 then return end -- open air above interior chips
		if y == 0 then
			-- do chip stuff
			if x>=-3 and x<=-2 and z>=-3 and z<=-2 then return BLACK end -- black chip
			if x>=0 and x<= 3 and z>=-3 and z<=-2 then return (x%2~z%2)+7 end -- red chip
			if (z==0 and X<=1) or (z>0 and X<=4) then return GREY end
			return EMPTY
		end
		if y==-1 then return GREEN end
	end
	-- back ports
	if y==-1 and z==-5 then
		if x==-3 then return WHITE end
		if x==-2 then return RED end
		if x==-1 then return YELLOW end	
		if x>=1 and x<=2 then return BLACK end
	end
	-- racing stripes
	if z==6 and y == 0 then return YELLOW end
	-- front slot
	if y==1 and z==5 and X<=4 then return end
	
	-- everything else in here is grey
	return GREY --body
end

-- return abs(y)<=2 and y^2+z^2*2-x^2 - 52 < 9 
-- and x^2*2+y^2-z^2 - 47<16 and GREY