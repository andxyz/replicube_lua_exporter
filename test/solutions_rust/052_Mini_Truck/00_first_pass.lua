-- cool little truck for a game idea
-- that I have about being a rabbit and
-- hopping across a busy road, trying
-- not to get squished!

-- I'm still working on the back story tho.
-- WHY does the rabbit need to cross so many
-- busy roads?

if x^2 < 5 then
	if y==-3 then return x^2 + z^2 == 8 and BLACK -- wheels
	elseif z > 2 and y == -1 and x^2 == 4 then return YELLOW -- lights
	elseif z > 1 and (y==2 or y==1) then return GREY -- windshield
	elseif z > 0 then return WHITE -- truck body
	elseif z==-3 and y==-1 and x^2 == 4 then return RED -- brake lights
	elseif z < 1 then return GREEN end -- dumper
end
