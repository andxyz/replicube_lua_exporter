--119
--8.740
local s= max(x*x,z*z)
if s>=10 then return end -- early exit

if s==9 then -- baseplate
	if y==-5 then
		return BLACK
	end
	return
end
if s==4 then
	if y<-1 then
		if y==-5 or y < 2-abs(t-12) then
			return DARKBLUE
		end
		return
	end
	return
end
if s==1 then
	if y<2 then
		if y==-5 or y < 3-abs(t-10.5) then
			return GREY
		end
		return
	end
	return
end
--if s==0 then -- how does CrashT know?? hahaha
	if y < 5-abs(t-9) then
		return WHITE
	end
--end
