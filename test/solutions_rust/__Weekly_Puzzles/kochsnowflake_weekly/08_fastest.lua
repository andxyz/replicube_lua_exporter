-- c/v:  5.285
-- size: 100
--[[ 
Note: I found "14 >" by accident when working with koch fractal shader 
	solutions using functions in other workbooks, once I realized I could get 
	both planes with "14 >" 
	so then... I simply brute forced the small black triangles
]]
if x+y+z==0 then
	-- The 2 large equilateral triangle planes:
--	if 14 > max(x-y, y-z, z-x) then return 1 end -- plane 1
--	if 14 > max(y-x, x-z, z-y) then return 2 end -- plane 2
	local a = x-y
	local b = y-z
	local c = z-x
	if a< 14 and b< 14 and c< 14 then return 1 end
	if a>-14 and b>-14 and c>-14 then return 2 end
	
	local XYZ = x^2+y^2+z^2
	if XYZ==266 or XYZ==248 or XYZ==234 or XYZ==194 then
		return BLACK -- The 4 black dots  
	end
end

-- local ya = x+y+z==0 -- not worth the variable
-- if ya then
--
-- Calculating the 4 dots for the black triangles:
--
-- return ({[194]=3,[234]=3,[248]=3,[266]=3})[XYZ] -- color table lookup trick
-- any obvious bitwise tricks?
-- 194 =  11000010_2
-- 234 =  11101010_2
-- 248 =  11111000_2
-- 266 = 100001010_2
--
--  Creates a bitwise shift-and-mask hash in lua5.4.8
--	if 1 << (x^2+y^2+z^2 >> 1 & 63) & 1161928712451522592 > 0 then
--		return BLACK
--	end
--
-- Creates a bitwise shift-and-mask hash in lua5.4.8
-- save space using a string to integer trick
--	if 1 << (x^2+y^2+z^2 >> 1 & 63) & 
--			tointeger("11".."61".."92".."87".."12".."45".."15".."22".."59".."2") > 0 then
--		return BLACK
--	end
--
-- Calculated the dots x^2+y^2+z^2 = ?? ahead of time by hand
-- 11^2+3^2+8^2  194
-- 12^2+3^2+9^2  234
-- 12^2+2^2+10^2 248
-- 13^2+4^2+9^2  266
