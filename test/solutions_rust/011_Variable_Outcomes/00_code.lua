color = EMPTY

if x == -y then
	color = YELLOW
elseif x == y then
	color = PINK
end

if z < 0 and color > 0 then
 	color = color + 1
end

if z == 0 then
	color = BLACK
end

return color
