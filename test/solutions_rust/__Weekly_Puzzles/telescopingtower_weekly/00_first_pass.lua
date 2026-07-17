--104
--9.184
local s= max(x*x,z*z)
if s>=10 then return end -- early exit
--c=({1,2,12,3})

if s==9 then return y==-5 and BLACK end -- baseplate

if s==4 and y<-1 and (y==-5 or y < 2-abs(t-12)) then 
	return DARKBLUE
end
if s==1 and y<2 and (y==-5 or y < 3-abs(t-10.5)) then 
	return GREY
end
if s==0 and y < 5-abs(t-9) then 
	return WHITE
end