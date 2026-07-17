--114
--12.579
if y<-extent+2 then
	if y==-extent then return BROWN end
	if y==-extent+1 then return GREEN end
else
	if x>=4 or x<=-4 then return end
	if y==-3 then return WHITE end
	if y>=3 and y<=extent then
		local ex=7-y%6
		if x<ex and x>-ex then return WHITE end
	end
	if y<=2 and not (x==0 and z>-3 and z<3) and x%2==0 and z%2==0 then 
		return WHITE
	end
end
