-- LOTS OF WIND RESISTENCE.
-- REALLY BEEFS UP THE ARMS!

-- EMPTYSPACE
if z ~= 0 then return end
if x^2 > 9 then return end
-- RACQUET
local b = max(abs(x),abs(y-2))
if b <= 3 then
 	if b == 3 then return RED end 
	if x^2 == 1 then return WHITE
	elseif y%2 == 1 then return WHITE end
end
if x == 0 then
	if y<-3 then return BLACK end
	if y<-1 then return RED end
end
