--64
--36.453
v = min(x^2, (abs(x)+abs(t-5)-10)^2) + round(y-sin(t))^2

if -v|ORANGE>=0 then print(-v|ORANGE) end

return
	v + (z+2)^2%12 <= 6 and
	({GREEN,WHITE,PEACH})[1-z//-6] or
	-v|ORANGE

--Who knew about "v==0 and ORANGE" relating to "-v|ORANGE", that seems crazy!
-- I suppose the reasoning is that negative numbers are EMPTY space?
-- So the only time that condition outputs a color is when v is zero?