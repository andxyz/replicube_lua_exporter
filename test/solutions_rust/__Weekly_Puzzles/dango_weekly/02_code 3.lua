-- remove empty space
if y<-1 or 1<y then return end

-- draw dango
local Z = z^2
if y == 0 and (z == 0 or Z == 16) then
	return YELLOW -- sticks
elseif Z<=25 then -- riceballs
	if (z+1)%4<3 and (x-1)%4<3 then
		local X = x^2
		return x<-4 and PINK
				or x<0 and X<=9 and WHITE
				or X<=9 and LIGHTGREEN 
	end
end

-- cycles: 5.497
-- codesize: 88
