-- 5.443
-- 102
--local ya = x+y+z==0
--if ya then
if x+y+z==0 then
	local XYZ = x^2+y^2+z^2
	if 14 > max(x-y, y-z, z-x) then return 1 -- plane 1
	elseif 14 > max(y-x, x-z, z-y) then return 2 -- plane 2
	else
		-- return ({[194]=3,[234]=3,[248]=3,[266]=3})[XYZ] -- color table lookup trick
		if XYZ==194 then return 3 end
		if XYZ==234 then return 3 end
		if XYZ==248 then return 3 end
		if XYZ==266 then return 3 end
		-- the 4 dots for the black triangles
		-- or 
		--11^2+3^2+8^2  194
		--12^2+3^2+9^2  234
		--12^2+2^2+10^2 248
		--13^2+4^2+9^2  266
	end
end
