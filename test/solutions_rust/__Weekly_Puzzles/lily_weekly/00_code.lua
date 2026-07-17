d = x^2+z^2
diagonal = abs(x+z)

if d <= 20 and (diagonal ~= 0 or x <= -1) then
	if y == -2 then
		return LIGHTGREEN
	elseif y == -1 then
		return diagonal
	end
end