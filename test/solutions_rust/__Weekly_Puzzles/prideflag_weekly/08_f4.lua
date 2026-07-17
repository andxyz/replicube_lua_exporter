-- f4
-- 117
-- 4.429
if z<-1 or z>1 then return end -- negative space
-- /Paranoia, paranoia, everybody's comin' to get me/
-- /Just say you never met me/	
if x<-7 then -- flagpole
	-- return .001^x/9.00000012e13
	if x>-11 then return GREY end
	return
end
if y<=0 then return end -- negative space below flag
-- flag
-- print("pi/2="..pi/2 .." pi/4="..pi/4)
-- z==round(sin(pi/2+x-t*pi/4))
-- z==round(cos(x-t*pi/4))
local flag_wave= cos(x-t*7.07)
flag_wave= flag_wave + 0.5 - (flag_wave + 0.5) % 1 -- faster round() function
if z==flag_wave then
	local flag_v= x+x+12+abs(y+y-13)
	if flag_v<20 then
		-- return ({WHITE,WHITE,PINK,LIGHTBLUE,BROWN,BLACK})[floor((flag_v+4)/4+1)] -- v
		-- or using https://ctenidium28.github.io/ctenidium28/:
		return 0x51.06A^(flag_v/4//1+1) -- v
	end
	-- return ({PURPLE,BLUE,GREEN,YELLOW,ORANGE,RED})[(y+1)//2]
	-- or using https://ctenidium28.github.io/ctenidium28/:
	return 0x9.00A7^(y+y%2)*.08 -- rainbow
end
