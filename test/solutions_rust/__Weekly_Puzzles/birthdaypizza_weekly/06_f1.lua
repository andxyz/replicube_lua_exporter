if y~=-3 then
	if z==0 and x==0 then
		if y==1 then return 9 else return y<1 end
	end
else
	local XZ=x^2+z^2
	if XZ==2 then return RED end
	if XZ<=7 then return YELLOW end	
	if XZ<=10 then return ORANGE end
end
