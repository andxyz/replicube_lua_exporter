-- f1
-- 109
-- 9.563
--
if x-8==z then return end
if x+8==z then return end
if y <= 0 then
	if x <= 0 and z <= 0 then
		return ORANGE
	end
	return
end
if y<=4 then
	if x>=2 or z>=2 then return end
	if x<=-7 or z<=-7 then return end
	return PEACH
end
if y<=6 then
	if x>=4 or z>=4 then return end
	if x<=-5 or z<=-5 then return end
	return GREY
end
if x>=0 and z>=0 then 
	return WHITE
end
