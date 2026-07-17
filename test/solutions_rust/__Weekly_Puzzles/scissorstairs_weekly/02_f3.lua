--f3
--137
--4.754
if x>=3 or x<=-3 or z>=3 or z<=-3 then return end -- empty space

if x==2 or x==-2 then -- bars
	if y%4==0 then
		if x<0 then
			if y%8==0 then return LIGHTBLUE else return BLUE end
		else 
			if y%8~=0 then return LIGHTBLUE else return BLUE end
		end
	end
	return
end

if z==2 or z==-2 then -- connectors
	if (x*sign(z))%4==(y-2)%4 then 
		if z>0 then
			if y%4==y%8 then return LIGHTBLUE else return BLUE end
		else
			if y%4~=y%8 then return LIGHTBLUE else return BLUE end
		end
	end
	return
end
