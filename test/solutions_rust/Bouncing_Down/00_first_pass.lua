-- Sometimes simple is best.

-- In this game you are simply a red ball
-- that needs to roll and bounce across
-- levels filled with obstacles, to reach the
-- exit.

-- potential title: Super Bouncy Ball
local X=x*x
if X>16 then return end
local T=t<=5 and clamp(t*2,0,6) or 2*(8-t)
local B=X+(y-1-T)^2+z*z
return 
	-z+1-t|-y-1+t//2 >= 0 and BROWN or
	-z+9-t|-y-5+t//2 >= 0 and BROWN or
	t<2 and -z-7-t|-y+3+t//2 >= 0 and BROWN or
	t>=2 and -z+15-t|-y-9+t//2 >= 0 and BROWN or
	B<=2 and RED