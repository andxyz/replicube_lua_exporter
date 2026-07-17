-- f2
-- 91
-- 5.834
--
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
if y<=6 then
	if x>=4 then return end
	if x<=-5 then return end 
	if z>=4 then return end
	if z<=-5 then return end
	return GREY
end
if x<=-1 then return end
if z<=-1 then return end
return WHITE
