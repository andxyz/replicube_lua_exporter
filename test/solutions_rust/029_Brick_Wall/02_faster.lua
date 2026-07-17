--67
--6.783
if y==-7 then
	return (x+1)//3 + (z+1)//3&1 == 1 and DARKBLUE or GREY
elseif z*z<=1 and y<5 then
	local v=y-1&4
	return (v==x or v==-x or y%4==1 ) and BLACK or RED
end
