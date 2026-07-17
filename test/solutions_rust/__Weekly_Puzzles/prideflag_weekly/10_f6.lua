-- f6
-- 193
-- 4.252
if z<-1 or z>1 then return end -- negative space
-- /Paranoia, paranoia, everybody's comin' to get me/
-- /Just say you never met me/
if x<=-8 then -- flagpole
	-- return .001^x/9.00000012e13
	if x>=-10 then return GREY end
	return
end
if y<=0 then return end -- negative space below flag
-- flag
-- print("pi/2="..pi/2 .." pi/4="..pi/4)
-- z==round(sin(pi/2+x-t*pi/4))
-- z==round(cos(x-t*pi/4))
local flag_wave= cos(x-t*7.07)
--flag_wave= flag_wave + 0.5 - (flag_wave + 0.5) % 1 -- faster round() function
--if z==flag_wave then
if z<=flag_wave+0.5 and z>=flag_wave-0.5 then
	if y>6 then -- top 1/2 of flag
		local flag_v2= y+x
--  	print(flag_v2)
		-- upper v
		if flag_v2<=4 then
			if flag_v2>=3 then return PINK end
			return WHITE
		elseif flag_v2<=10 then
			if flag_v2<=6 then return LIGHTBLUE end
			if flag_v2<=8 then return BROWN end
			return BLACK
		end
		
		-- upper rainbow
		if y>10 then return RED end
		if y>8 then return ORANGE end
		return YELLOW
	else  -- bottom 1/2 of flag
		local flag_v2= y-x
--		print(flag_v2)
		-- lower v
		if flag_v2>=9 then
			if flag_v2<=10 then return PINK end
			return WHITE
		elseif flag_v2>=3 then
			if flag_v2>=7 then return LIGHTBLUE end
			if flag_v2>=5 then return BROWN end
			return BLACK
		end

		-- lower rainbow
		if y>4 then return GREEN end
		if y>2 then return BLUE end
		return PURPLE
	end
end
