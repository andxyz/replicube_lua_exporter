--f2
--226
--7.238
if y>7 then return end -- empty space
if y<0 then -- tree trunk, faster near top
	if (z==0 and x==0) then return BROWN end
	return 
end

local v= abs(x)+abs(z)
if v>14 then return end -- empty space, wasnt faster

if y==0 then -- needed this first before y<4
--	if v>8 then return end -- empty space, wasnt faster
	if v<=8 and (z==0 or x==0) then return BROWN	end
	return
end
if y<4 then -- faster near top
--	if v>8 then return end -- empty space, wasnt faster
	if v==8 and (z==0 or x==0) then return ORANGE end
	return
end

if y==7 then
 	if x%2==0 and (v-2)%4==0 then return LIGHTGREEN end
	return
end
if y==6 then
	if v>=10 or (v<=6 and v>=2) then
		if z%4==0 or x%4==0 then
			return GREEN
		end
	end
	return
end
if y==5 then
--	if v>12 then return end -- empty space, wasnt faster
	if v==12 or v==4 then
		if z%4==0 or x%4==0 then
			return GREEN
		end
	end
	return
end
--if y==4 then
--	if v>12 then return end -- empty space, wasnt faster
	if v<=12 and v>=4 then
		local Z8,X8= (z%8),(x%8)
		if Z8==0 or X8==0 then
			return ORANGE
		end
	end
--	return
--end
