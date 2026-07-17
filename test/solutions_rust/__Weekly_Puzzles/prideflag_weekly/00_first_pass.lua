-- first_pass
-- 140
-- 4.885
if z<-1 or z>1 then return end
if x<-7 then if x>-11 then return GREY end return end
if y>0 then
	if z==round(sin(pi/2+x-t*pi/4)) then
		local v1= (x+6)+abs(y-7)
		local v2= (x+6)+abs(y-6)
		if v1 < 10 or v2 < 10 then
			local i= (v1+v2+4)/4+1
			return ({WHITE,WHITE,PINK,LIGHTBLUE,BROWN,BLACK})[floor(i)]
		end
		return ({PURPLE,BLUE,GREEN,YELLOW,ORANGE,RED})[(y+1)//2]
	end
end