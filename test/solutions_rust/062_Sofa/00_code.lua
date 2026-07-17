-- no game idea here, I just wanted to make a sofa lol

if y>-1 then 
	if z==-4 and y==0 and x*x<16 then return BROWN end
	return 0
end
if y==-extent then return PEACH end
if z<0 then	
	local X,Z=x*x
	if X==16 or y==-3 then return DARKBROWN end
	if y==-2 then return BROWN end
	if z==-extent and y==-1 then return BROWN end
elseif z>1 then
	if y>=-1 then return 0 end
	local dz=z-3
	local X,Z=x*x,dz*dz
	if y==-3 and X+Z==5 then return DARKBROWN end
	if y==-2 and X<=4 then return BROWN end
end
