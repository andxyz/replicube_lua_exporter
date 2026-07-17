-- this is so slow on my pc I cannot optimize, lol

-- cut out deadspace
if y>9 or z>9 then return end

-- excluding space between spheres doesnt add speed :(
-- local X = abs(x)
-- if t<6 or t>25 then
-- 	if t<6 and X < 8 - t then return
-- 	elseif t>25 and X < (26-t) then return end
-- end

-- min function with blending (k modifies smoothness)
-- minSmoothBlend
function sb(a,b,k)
	return (a + b - ((b - a)^2+(k * 2)^2)^0.5)/2
end

return sb(
				(x+16-1*t)^2 + y^2 + z^2 - 50, 
				(x-16+1*t)^2 + y^2 + z^2 - 50, 
				40) < 0 and abs(x)%16+1