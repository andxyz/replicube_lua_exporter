--f1
--96
--45.341
if x%20==z%20 and y%20==z%20 and y*y>16 then
	return x+y+z&1 | 10
else
	for i= -6, 6, 12 do
		t= {abs(x+i), abs(y+i), abs(z+i)}
		sort(t)
		if t[2]==10 and t[3]==10 then
			return x+y+z&1 | 10
		end
	end
end
