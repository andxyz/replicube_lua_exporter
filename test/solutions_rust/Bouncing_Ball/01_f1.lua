if y<-5 then return BROWN end

local circle = x*x+z*z
if circle > 20 then return end

if t==0 then
	if y>-5 then return
	else return circle <= 20 and GREEN end
end

if circle > 10 then return end
if t==1 or t >=4 then
	local offset = t==4 and -3 or t==5 and -2 or t==6 and -1 or 3
	return circle+(y+offset)^2 <= 12 and GREEN
end

if t==2 or t==3 then
	if circle >= 6 then return end
	if y<-3 or y>6 then return end
	
	local offset = t==3 and 1 or 0
	if y>=-1+offset and y<=3+offset then
		return circle <= 6 and GREEN
	end
	if y>3+offset then
		if circle >= 3 then return end	
		return circle+(y-4-offset)^2 <= 2 and GREEN
	end
	if y<-1+offset then
		if circle >= 3 then return end	
		return circle+(y+2-offset)^2 <= 2 and GREEN
	end
end
