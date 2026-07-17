-- basically the shape is the surface
-- of two quarter-circles connected with
-- a straight line...
d = round(sqrt((x-4)^2 + y^2))
if d < 5 then
	return EMPTY
elseif d == 5 then
	return WHITE
else
	return BLUE
end