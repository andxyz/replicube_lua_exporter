--f1
--226
--13.966
if y>7 then return end

local v= abs(x)+abs(z)
if v>14 then return end

if y==7 then
 	if (x%2==0) and (v-2)%4==0 then return LIGHTGREEN end
	return
end
local Z4_x_X4= (z%4)*(x%4)
if y==6 then
	if (Z4_x_X4==0) and ((v<=14 and v>=10) or (v<=6 and v>=2)) then 
		return GREEN
	end
	return
end
if y==5 then
	if (Z4_x_X4==0) and (v==12 or v==4) then return GREEN end
	return
end
local Z8_x_X8= (z%8)*(x%8)
if y==4 then
	if (Z8_x_X8==0) and (v<=12 and v>=4) then return ORANGE	end
	return
end
if y<4 and y>0 then
	if (Z8_x_X8==0) and v==8 then return ORANGE	end
	return
end
if y==0 then
	if (z==0 or x==0) and (v<=8 and v>=0) then return BROWN	end
	return
end
if (z==0 and x==0) then return BROWN end
