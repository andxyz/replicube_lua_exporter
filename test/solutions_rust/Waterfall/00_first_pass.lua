-- good luck!
GOTIME=1
if GOTIME==1 then PEACH=0 end
local X,Y=x*x,y*y
-- riverzone
if X<=1 then
	local c1 = (z-t)%4==0 and LIGHTBLUE or BLUE
	local c2 = (y-2+t)%4==0 and LIGHTBLUE or BLUE
	-- splashes
	if z==1 and X<=1 and (y==-1 or y==-2) then return (y+x+t)%2==0 and WHITE end
	-- river
	if (y>=-2 and z==0) then return (y>=-2 and y<=2) and c2 or PEACH
	elseif (y>=-3 and z>=0) then return y==-3 and c1 or PEACH
	elseif (y>=2 and z<=-1) then return y==2 and c1 or PEACH
	end
else
	-- upper grasslands
  if (y>=3 and z<0) then
  	if y==3 then return GREEN end
  	return PEACH
  end
  -- front grasslands
  if (y>=-2 and z>=0) then
  	if y==-2 then return GREEN end
  	return PEACH
  end
end
return BROWN
