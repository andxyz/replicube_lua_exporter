--f2
--130
--21.111
local Z= z%20
if x%20==Z and y%20==Z and y*y>16 then
	return x+y+z&1 | 10
elseif x==-16 or x==16 or x==4 or x==-4 or y==16 or y==-16 or y==4 or y==-4 then	
	for i = -6, 6, 12 do
		local t= {abs(x+i), abs(y+i), abs(z+i)}
		sort(t)
		if t[2]==10 and t[3]==10 then
			return x+y+z&1 | 10
		end
	end
end
