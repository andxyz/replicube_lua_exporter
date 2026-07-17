-- Just add code to grow this sapling
--9.164
if y>=0 then
	if x*x+z*z + (y-3)^2 < 16 then
		return y%2==0 and (2*(x-y/2-1)-(z+1))%6==0 and PINK or PEACH
	else
		return
	end
elseif x==0 and z==0 then
	return DARKBROWN
elseif y==-6 then
	if x*x+z*z<25 then
		if (x==2 or x==-4) and z==2 
					or x==-1 and z==-1 
					or x==2 and z==-4 then
			return PINK
		elseif z%2==x%2 then
			return PEACH
		else
			return GREEN
		end
	else
		return GREEN
	end
end

--y 
--0 1
--2 2
--4 3
--6 4
  