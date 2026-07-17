-- Every game dev needs to learn
-- the animation fundamentals of
-- 'squash and stretch' for more
-- satisfying game feel!
if y<-5 then return BROWN end

if t==0 and y==-5 then
	return x*x+z*z <= 20 and GREEN
end
if t==1 or t >=4 then
	local offset = (t==1 or t==7) and 3 or t==4 and -3 or t==5 and -2 or t==6 and -1
	return x*x+(y+offset)^2+z*z <= 12 and GREEN
end
if t==2 or t==3 then
	local offset = t==3 and 1 or 0
	if inrange(y,-1+offset,3+offset) then
		return x*x+z*z <= 7 and GREEN
	end
	if y>3+offset then
		return x*x+(y-4-offset)^2+z*z <= 2 and GREEN
	end
	if y<-1+offset then
		return x*x+(y+2-offset)^2+z*z <= 2 and GREEN
	end
end
