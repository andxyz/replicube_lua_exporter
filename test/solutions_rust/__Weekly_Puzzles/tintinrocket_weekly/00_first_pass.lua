-- first_pass
-- 263
-- 7.753

if y>-5 then
	if (x>2 or z>2 or z<-2 or x<-2) then return end
	if y>1 and (x>1 or z>1 or z<-1 or x<-1) then return end
end
if y==-10 then return YELLOW end
local c= x*x+z*z
if y==-9 and c<=164 then return YELLOW end
if y==-8 and c<=109 then return YELLOW end
if y==-7 and c<=53 then return YELLOW end
if y==-6 and c<=20 then return GREY end
if y==-5 and c>=10 and c<=16 then return GREY end
if y>0 and y<9 and c<=2 then
	if y<8 then
		if y>2 then
			if c==0 then
				return RED
			elseif (x+z)%2==y%2 then
				return RED
			else
				return WHITE 
			end
		end
		return RED
	end
	if c<=1 then return RED end
end
if y>-3 and y<2 then
	if z>0 and c==8 then
		return RED
	elseif z<0 then
		if x==0 and c==4 then return RED end
	end
end
if c==0 then
	if y>0 then return RED end
	if y%2==0 then return YELLOW else return ORANGE end 
end
