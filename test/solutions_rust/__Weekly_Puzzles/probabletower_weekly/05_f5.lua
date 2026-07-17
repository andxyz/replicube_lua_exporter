-- f5
-- 118
-- 5.817

if y<=0 then
	if x>=1 then return end
	if z>=1 then return end
	return ORANGE
end
if y<=4 then
	if x>=2 then return end
	if z>=2 then return end
	if x<=-7 then return end
	if z<=-7 then return end
	return PEACH
end
if y==7 then
	if x<=-1 then return end
	if z<=-1 then return end
	return WHITE
end
if x>=z then
	if x>=4 then return end
	if z<-4 then return end
	return GREY
end
if z>=4 then return end
if x<=-5 then return end
return GREY

