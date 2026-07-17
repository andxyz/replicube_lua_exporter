-- bed of choice for getting 
-- beefbrain in hypnospace outlaw

-- empty space
if y>2 then return end

-- floor
if y==-4 then return DARKBROWN end

-- bed
if x==-4 then 
	if z^2==9 and y < 1 then return BROWN -- small posts
	elseif z^2<9 and (y==-1 or y ==-2) then return BROWN end -- small bedframe
elseif x==4 then
	if z^2==9 and y < 3 then return BROWN -- tall posts
	elseif z^2<9 and y^2<=4 and y~= 2 then return BROWN end -- tall bedframe
elseif y ==-2 and z>-3 and z<3 then
	return PEACH
elseif (y==-1 or y ==-2) and x^2<=9 and z^2<=9 then
	local v= y==-1 and -1 or 0
	return 
		(x+z)%2==0 and 14+v or 
		(x+z)%2==1 and z%2==0 and 15+v or 
		(x+z)%2==1 and z%2==1 and 13+v -- sheets
elseif y == 0 and (z^2==1 or z^2==4) and (x==2 or x==3) then 
	return PEACH -- pillows
end
