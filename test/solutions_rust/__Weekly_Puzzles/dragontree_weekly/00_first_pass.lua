--235
--14.476
if y>7 then return end

local v= abs(x)+abs(z)
if y==7 then
 	if (x%2==0) and (v==14 or v==10 or v==6 or v==2) then return LIGHTGREEN end
	return
end
if y==6 then
	if (z%4==0 or x%4==0) and ((v<=14 and v>=10) or (v<=6 and v>=2)) then return GREEN end
	return
end
if y==5 then
	if (z%4==0 or x%4==0) and (v==12 or v==4) then return GREEN end
	return
end
if y==4 then
	if (z%8==0 or x%8==0) and (v<=12 and v>=4) then return ORANGE	end
	return
end
if y<4 and y>0 then
	if (z%8==0 or x%8==0) and v==8 then return ORANGE	end
	return
end
if y==0 then
	if (z==0 or x==0) and (v<=8 and v>=0) then return BROWN	end
	return
end
if (z==0 and x==0) then return BROWN end
