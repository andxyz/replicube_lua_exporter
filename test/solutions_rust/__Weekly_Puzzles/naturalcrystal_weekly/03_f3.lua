--f3
--53
--10.705
if x//2 + z//2 < -y-2 then -- stairs
	return GREY
end
if x~=z and x~=-z then return end -- negative space
local X= x*x
if X==4 and y<3 or y+X==4 then return LIGHTBLUE end -- cross
