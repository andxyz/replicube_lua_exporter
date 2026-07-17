-- codesize: 147
-- 20.424

local X,Y,Z=x*x,y*y,z*z
if X+Y+Z<=3 then 
	return PINK 
else
	local c=(x+y+z)%2==1 and DARKBLUE or BLACK
	return 
	y==-2 and X+Z<4 and x%2-z%2==0 and WHITE or
	x==-2 and Y+Z<4 and z%2==1 and WHITE or
	z==-2 and x==y and X+Y<4 and WHITE or
	z==2  and X+Y==2 and WHITE or
	y==2  and x==-z and X+Z==2 and WHITE or
	x==2  and Y+Z==0 and WHITE or
	c
end
