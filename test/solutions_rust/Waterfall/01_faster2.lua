-- good luck!
--  13.093
local X,Y=x*x,y*y
-- riverzone
if X<=1 then
	-- splashes
	if z==1 and X<=1 and (y==-1 or y==-2) then return (y+x+t)%2==0 and WHITE end
	-- river
	local c1 = (z-t)%4==0 and LIGHTBLUE or BLUE
	local c2 = (y-2+t)%4==0 and LIGHTBLUE or BLUE
	if (y>=-2 and z==0) then return (y>=-2 and y<=2) and c2 or 0
	elseif (y>=-3 and z>=0) then return y==-3 and c1 or 0
	elseif (y>=2 and z<=-1) then return y==2 and c1 or 0
	end
else
	-- upper grasslands
  if (y>=3 and z<0) then
  	if y==3 then return GREEN end
  	return
  end
  -- front grasslands
  if (y>=-2 and z>=0) then
  	if y==-2 then return GREEN end
  	return
  end
end
return BROWN
