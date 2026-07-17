--f3
--145
--24.030
local Z= z%20
if x%20==Z and y%20==Z and y*y>16 then
	return x+y+z&1 | 10
elseif x==-16 or x==16 or x==4 or x==-4 or y==16 or y==-16 or y==4 or y==-4 then	
	local function f(i)
		local t= {abs(x+i), abs(y+i), abs(z+i)}
		sort(t)
		return t[2]==10 and t[3]==10
	end 
	if f(6) then
		return x+y+z&1 | 10
	elseif f(-6) then
		return x+y+z&1 | 10
	end
end
