-- just add code to grow this sapling

local XZ=x*x+z*z 
if XZ + (y-3)^2 < 16 then
	return y%2==0 and (2*(x-y/2-1)-(z+1))%6==0 and PINK or PEACH
elseif x|z == 0 and y <= -1 then
	return DARKBROWN
elseif y == -extent then
	return XZ<25 and (
			(((x==2 or x==-4) and z==2 or 
				 x==-1 and z==-1 or 
				 x==2 and z==-4
		 	) and PINK
			) or z%2 == x%2 and PEACH 
			) or GREEN
	end

--y 
--0 1
--2 2
--4 3
--6 4
  