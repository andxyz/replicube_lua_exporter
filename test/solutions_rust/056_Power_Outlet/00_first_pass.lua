-- I want to make something with a 'power
-- source' theme.

-- how about this: a robot that requires
-- electricity to move. it's head is it's
-- power source, and it can throw it's head
-- around to power things and solve puzzles,
-- but it's body can't last long without it's
-- head?

-- could be a fun idea for a puzzle platformer.

-- empty space
if z>0 then return end
if z>-4 and z~=0 and y^2<=9 and x^2<=4 then return end

local Y = y^2
local X = x^2

-- faceplate
if z==0 then
	if Y<=25 and X<= 9 then
		if X==1 and (y==2 or y==3) then
			return 0
		elseif X==1 and (y==-1 or y==-2) then
			return 0
		elseif x==0 and (y==1 or y==-3) then
			return 0
		else 
			return WHITE
		end
	end
else
	-- the boxes behind
	if Y<=16 then
		if z<=-5 then return GREY end
		if z==-4 and X<=9 then return GREEN end
		if X==9 then return GREEN end
		if Y==16 and X<=9 then return GREEN end
	end
	return GREY
end

