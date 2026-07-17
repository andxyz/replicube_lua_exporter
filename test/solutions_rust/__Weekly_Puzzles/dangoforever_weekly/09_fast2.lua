--120
--12.359

if y>=4 or y<=-4 then return end

if x>=3 then
	x= (x+abs(t-5)-10)^2
elseif x <= -3 then
	x= (-x+abs(t-5)-10)^2
else
	x= x^2
end
local v = x+round(y-sin(t))^2

if z>=-4 and v + (z+2)^2%12 <= 6 then
	return ({GREEN,WHITE,PEACH})[1-z//-6]
elseif v==0 then 
	return ORANGE
end
