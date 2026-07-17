--f6
--182
--18.951
if x%4==0 or y%4==0 then
	if x==-16 or x==16
		 or x==4 or x==-4
		 or y==16 or y==-16
		 or y==4 or y==-4 then
		--upper cube
		local t= {abs(x-6), abs(y-6), abs(z-6)}
		sort(t)
		if t[3]==10 and t[2]==10 then
			return x+y+z&1 | 10
		end
		--lower cube
		local t= {abs(x+6), abs(y+6), abs(z+6)}
		sort(t)
		if t[3]==10 and t[2]==10 then
			return x+y+z&1 | 10
		end
	end
end
if x%20==z%20 and y%20==z%20 and y*y>16 then -- diagonal lines
	return x+y+z&1 | 10
end
-- This is where I get off the branching bus
