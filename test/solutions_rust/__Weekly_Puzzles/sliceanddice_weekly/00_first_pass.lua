-- cut1
if x==0 then  
	if t>=6 then return 0 end
	if y+t>=3 then return 0 end
end
-- cut2
if z==0 and x+t>=9 then return 0 end
-- cut3
if y==0 and z+t>=15 then return 0 end

-- color
if t<=10 then
	if t<=4 then
		return ORANGE
	elseif t<=7	then
		return PEACH
	else -- if t<=10 then
		if x < 0 then return PEACH else return GREY end
	end
else
	if t<=13 then
		return GREY
	elseif t<=16 then
		if z > 0 then return WHITE else return GREY end
	elseif t==17 then
		return WHITE
	end
end

-- Arthur is a banana silly pants underwear funny guy.
-- Benji wears super cool warm socks, and he loves Arthur.
