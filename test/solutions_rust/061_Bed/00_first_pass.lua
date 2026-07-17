-- bed of choice for getting 
-- beefbrain in hypnospace outlaw

-- empty space
if y>2 then return end

-- floor
if y==-4 then return DARKBROWN end

-- bed
if x==-4 then 
	if z^2==9 and y < 1 then return ORANGE -- small posts
	elseif z^2<9 and (y==-1 or y ==-2) then return ORANGE end -- small bedframe
elseif x==4 then
	if z^2==9 and y < 3 then return ORANGE -- tall posts
	elseif z^2<9 and y^2<=4 and y~= 2 then return ORANGE end -- tall bedframe
elseif (y==-1 or y ==-2) and x^2<=9 and z^2<=9 then 
	return x%2 + 5 -- sheets
elseif y == 0 and (z^2==1 or z^2==4) and (x==2 or x==3) then 
	return WHITE  -- pillows
end
