if y>=4 or y<=-4 then return end

local yy = y-round(sin(t))

local xx = (x>=3 or x<=-3) and abs(x)+abs(t-5)-10 or x

local function ball(xx,yy,zz)
	return xx^2 + yy^2 + zz^2 <= 6
end

return 
ball(xx,yy,z-10) and PEACH or
ball(xx,yy,z-4) and WHITE or
ball(xx,yy,z+2) and GREEN or
xx|yy==0 and ORANGE
