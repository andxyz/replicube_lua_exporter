-- 88
-- 6.107

-- all compasses lead to Santa's house in the north pole.
if z>1 or z<-1 then return end
local circ = x^2 + y^2

if circ > 20 then return end
 
if z== -1 then
	return DARKBLUE
elseif z==0 then
	if x==0 and y<=2 and y>=-2 then
		if y>=0 then return RED
		else return GREY end
	elseif circ <= 12 then
		return WHITE
	else
		return DARKBLUE
	end
elseif z==1 and circ >= 12 then
	return BLUE
end
