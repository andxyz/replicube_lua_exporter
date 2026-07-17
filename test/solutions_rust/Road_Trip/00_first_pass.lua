--267
--12.260

-- good luck!

-- road and dirt
local X=x*x
if y<=-3 then
	if X<=9 and y==-3 then
		if X==4 then
			local tx = t%7
			local stripe_v1 = (z+7-tx)//3%7
			local stripe_v2 = (z-tx)//3%7
			if stripe_v1==0 or stripe_v2==0 then return YELLOW else return DARKBLUE end
		else
			return DARKBLUE
		end
	end
	return ORANGE
end

-- wheels
if y>=-2 and y<=-1 and 
	   (z>=-3 and z<=-2 or z>=2 and z<=3) 
	   and X==1 then
	return BLACK
end

-- car
--if x|y|z==0 then
--	print(t//2%2)
--end
if X<=1 and z>=-4 and z<=4 then
	local bump_y=t//2%2
	if (y==1+bump_y or y==2+bump_y) and (z==4 or z<=-3) then
		return
	elseif y>=-1+bump_y and y<=2+bump_y then
		return LIGHTBLUE
	end
end

-- cacti
if y<=4 and X==25 then
	local cactus_periodic = (z-t+(x==5 and 10 or 0))%20
	if cactus_periodic == 2 then return GREEN end
	if y==0 and cactus_periodic == 1 then return GREEN end
	if y<=3 and y>=0 and cactus_periodic == 0 then return GREEN end
	if y==1 and cactus_periodic == 3 then return GREEN end
	if y<=2 and y>=1 and cactus_periodic == 4 then return GREEN end
end

