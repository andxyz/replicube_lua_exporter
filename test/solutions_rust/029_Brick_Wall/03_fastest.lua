--81
--6.061
if y==-7 then
	return (x+1)//3 + (z+1)//3&1 == 1 and DARKBLUE or GREY
elseif z<2 and z>-2 and y<5 then
	if y%4==1 then
		return BLACK
	elseif x%4==0 and (y-1&4==x or y-1&4==-x) then
		return BLACK
	else
		return RED
	end
end
