-- LOTS OF WIND RESISTENCE.
-- REALLY BEEFS UP THE ARMS!

-- EMPTYSPACE
if z ~= 0 then return end
if x^2 > 9 then return end
-- RACQUET
if y>-2 then
	if x^2 == 9 then return RED end
	if y == -1 or y==5 then return RED end
	if x%2 + y%2 > 0 then return WHITE end 
end
-- HANDLE
if x == 0 then
	if y<-3 then return BLACK end
	if y<-1 then return RED end
end
