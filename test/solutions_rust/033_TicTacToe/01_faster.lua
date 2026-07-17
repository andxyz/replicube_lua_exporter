-- it's X's turn :)
if z == 0 then
	local X,Y=x*x,y*y
	if Y==4 or X==4 then return WHITE end
	if X<=1 and X==Y then return RED end
	if x>0 and X>=9 and Y>=9 and (x+y)%2 == 1 then return GREEN end
end
-- ok your turn
-- if x>0 and x^2>8 and y^2<4 and (x+y)%2 == 0 then return RED end
