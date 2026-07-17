-- remove empty space
if y<-1 or 1<y then return end

-- draw dango
if y^2 > 1 then return EMPTY
elseif y == 0 and (z == 0 or z^2 == 16) then
	return YELLOW -- sticks
elseif z^2<26 and y^2<2 then -- riceballs
	yes = (z+1)%4<3 and (x-1)%4<3
	if yes then
		return x<-4 and PINK
				or x<0 and x^2<10 and WHITE
				or x^2<10 and LIGHTGREEN 
	end
end
-- 6.724
-- 102
