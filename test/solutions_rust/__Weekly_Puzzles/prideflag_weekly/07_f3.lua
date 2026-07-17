-- f3
-- 115
-- 4.580
if z<-1 or z>1 then return end
if x<-7 then if x>-11 then return GREY end return end -- flagpole sitter
if y>0 then -- flag
  -- print("pi/2="..pi/2 .." pi/4="..pi/4)
	-- z==round(sin(pi/2+x-t*pi/4))
	if z==round(sin(1.57+x-t*0.785)) then -- wave
		local flag_v= x+x+12+abs(y+y-13)
		if flag_v<20 then
			return ({WHITE,WHITE,PINK,LIGHTBLUE,BROWN,BLACK})[floor((flag_v+4)/4+1)] -- v
		end
		-- return ({PURPLE,BLUE,GREEN,YELLOW,ORANGE,RED})[(y+1)//2]
		-- or using https://ctenidium28.github.io/ctenidium28/ cheat-codes:
		return 0x9.00A7^(y+y%2)*.08 -- rainbow
	end
end