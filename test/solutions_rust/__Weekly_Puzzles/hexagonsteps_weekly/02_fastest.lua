xx = {x,x+3,x-3,x-3,x+3,x+0,x+0}
yy = {y,y-3,y+3,y+0,y+0,y-3,y+3}
zz = {z,z+0,z+0,z+3,z-3,z+3,z-3}
-- negative space (trick for speed)
if not inrange(x+y+z,-1,1) then return end
-- cube babies
for i = 1,7 do
	if max(xx[i]^2, yy[i]^2, zz[i]^2) == 1 
	  and min(xx[i], yy[i], zz[i]) + max(xx[i], yy[i], zz[i]) == 0 then
		return i == 1 and ORANGE or YELLOW
	end
end -- 64.960
