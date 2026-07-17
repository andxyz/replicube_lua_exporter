-- dogfighting game, but simplified
-- into 2D, with a focus on game feel
-- and arcade thrills!
-- empty space
if y>4 or y<-4 then return end

-- prop
local Y=y*y
local Z=z*z
if x==7 then
	if z==0 then return Y<=4 and BLACK end
	if y==0 then return Z<=4 and BLACK end
	return
end

-- head
if x==-1 and y==2 and z==0 then return YELLOW end

-- main chamber
if Y+Z<=2 then
	if z==0 then
		if x==-1 and y==1 then return DARKBLUE end --shirt
		if x==0 or x==1 then return end
	end
	return RED --body
end

if x>0 then
	-- front accessories
	local dy = y-1
	local YY=dy*dy
	if YY == 9 and inrange(x,1,3) then return RED end -- wings
	if x==2 and Z==25 and YY<=4 then return BLACK end -- bars
	if x==2 and y==2  and Z<=1 then return GREY end -- window
	if x==4 and y<=0  and (z==y or z==-y) and Z+Y<=18 then return RED end -- landing gear
	if x==4 and y==-4 and Z==9 then return BLACK end -- wheel rubber
	return
elseif x<-2 then
	-- rear design
	if y>=0 and (y==0 or z==0) and Y+Z < 3/4*(x+2)^2 then return RED end -- tail fins
	if x==-6 and y==-2 and z==0 then return BLACK end -- read wheel
	return
end