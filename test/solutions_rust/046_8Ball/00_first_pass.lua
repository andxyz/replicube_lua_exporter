-- DOUBLES AS A FORTUNE-TELLING
-- DEVICE HAHA

-- hmmm... I wonder what else we can do to speed it up
local X = x^2
local Z = z^2
local c = X + y^2 + Z
if c >= 64 then return end -- empty space
if c <= 63 then 
	if y ~= 7 then return BLACK end -- the ball
	if Z<2 and X<9 then -- inside figure8
		if X==1 and z==0 then return WHITE end 
		return BLACK 
	end
	return WHITE -- surrounding white
end
