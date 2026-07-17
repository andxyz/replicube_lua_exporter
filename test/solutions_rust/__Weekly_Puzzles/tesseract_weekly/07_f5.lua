--f5
--191
--20.588
if x==-16 or x==16 or x==4 or x==-4 or y==16 or y==-16 or y==4 or y==-4 then	
	--upper cube
	if max(abs(x-6), abs(y-6)) == 10 and abs(z-6) == 10
		or max(abs(x-6), abs(z-6)) == 10 and abs(y-6) == 10 then
		return x+y+z&1 | 10
	end
	--lower cube	
	if max(abs(x+6), abs(y+6)) == 10 and abs(z+6) == 10
		or max(abs(x+6), abs(z+6)) == 10 and abs(y+6) == 10 then
		return x+y+z&1 | 10
	end
elseif x%20==z%20 and y%20==z%20 and y*y>16 then -- diagonal lines
	return x+y+z&1 | 10
end
-- This is where I get off the branching bus