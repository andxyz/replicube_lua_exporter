-- sushi?
local XY=max(abs(x),abs(y))
if XY==2 then
	return GREEN
elseif XY==1 then
	return WHITE
else
	return RED 
end
--12.360