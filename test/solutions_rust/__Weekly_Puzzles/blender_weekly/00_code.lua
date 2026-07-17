ax = abs(x)
ay = abs(y)
az = abs(z)

top = max(ax,az)

if top == 2 then
	return RED
elseif top < 2 then
	return WHITE
end