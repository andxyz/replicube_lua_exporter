-- it's X's turn :)
c = EMPTY
if z == 0 then
	if y^2==4 or x^2==4 then c = WHITE end
	if x^2<2 and x^2 == y^2 then c = RED end
	if x>0 and x^2>8 and y^2>8 and (x+y)%2 == 1 then c = GREEN end
end
return c