--109
--8.742
if y<-3 then
	if y==-5 then return BROWN end
	if y==-4 then return GREEN end
else
	if x>=4 or x<=-4 then return end
	if y==-3 then return WHITE end
	if y>=3 and y<=5 then
		local v=7-y%6
		if x<v and x>-v then return WHITE end
	end
	if y<=2 and not (x==0 and z>=-3 and z<=3) then
		if x%2==0 and z%2==0 then
			return WHITE
		end
	end
end
