--13.431
--
-- TO GO WITH THE SQUARE
-- BASKETBALL.

-- EMPTY space
if (z+2)|(y+1)>0 then return end
-- The backetball net
if z==-3 then
	if max(x^2, (y-1)^2) == 4 then return WHITE end
	return y>-extent and GREY 
end
if y==-extent+2 then
	if z==-2 and x^2<=1 then return RED end
	if max(x^2,(z-1)^2) == 4 then return RED end
end
if y==-extent+1 then
	local v=(x*x+(z-1)^2) 
	if v == 4 or v == 8 then return WHITE end
end
if y==-extent and x*x+(z-1)^2==5 then return WHITE end
