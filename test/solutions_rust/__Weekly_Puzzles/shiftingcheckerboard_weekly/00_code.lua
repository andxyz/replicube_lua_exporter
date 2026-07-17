if t <= 6 and y >= 2 then
	x = x-t
elseif inrange(t, 12, 18) and y <= -2 then
	x = x+t
end

return ((x+1)//3)%2