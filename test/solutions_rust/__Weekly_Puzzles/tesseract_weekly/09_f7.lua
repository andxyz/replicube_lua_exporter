--f7
--191
--15.940
local Z= z%20
if (x%20==Z and y%20==Z) and (y>4 or y<-4) then -- diagonal lines
	return x+y+z&1 | 10
elseif (x%4==0 or y%4==0) then -- the cubes
	if (x==16 or x==-4 or y==16 or y==-4) then
		--upper cube
		local t= {abs(x-6), abs(y-6), abs(z-6)}
		sort(t)
		if t[3]==10 and t[2]==10 then
			return x+y+z&1 | 10
		end
	end
	if (x==-16 or x==4 or y==-16 or y==4) then
		--lower cube
		local t= {abs(x+6), abs(y+6), abs(z+6)}
		sort(t)
		if t[3]==10 and t[2]==10 then
			return x+y+z&1 | 10
		end
	end
end
-- This is where I get off the branching bus of madness
