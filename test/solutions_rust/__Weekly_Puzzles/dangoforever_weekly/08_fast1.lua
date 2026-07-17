--130
--13.006

if y>=4 or y<=-4 then return end

local yy = (y-round(sin(t)))^2
local xx = x^2
if x>=3 then
	xx=(x+abs(t-5)-10)^2
elseif x <= -3 then
	xx=(-x+abs(t-5)-10)^2
end

if xx + yy + (z-10)^2 <= 6 then
	return PEACH
elseif xx + yy + (z-4)^2 <= 6 then 
	return WHITE
elseif xx + yy + (z+2)^2 <= 6 then
	return GREEN
elseif xx==0 and yy==0 then 
	return ORANGE
end
