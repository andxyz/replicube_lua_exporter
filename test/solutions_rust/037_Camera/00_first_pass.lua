-- This one turned out very CUTE IMO

-- camera body
if z^2<2 then
	if y==3 then
		-- button 
		if x==-2 and z==0 then return RED end
		-- twista
		if (x-1)^2<2 then return GREY end
	else
		-- dadbod
		return GREY
	end
end
-- lens
if z>1 then
	v = x^2 + (y+1)^2
	if v < 8 then
		return v < 3 and WHITE or BLACK 
	end
end
