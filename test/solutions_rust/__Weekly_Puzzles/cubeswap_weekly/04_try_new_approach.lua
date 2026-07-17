--264
--17.534
-- empty space
if z<-1 or z>1 or y<-3 or x<-3 or y>3 or x>3 then return end

--t = t%12

local X,XX,Y,YY=0,0,0,0

--function pprint(xx,yy,zz,var)
--	if x==xx and y==yy and z==zz then print(var) end
--end

if inrange(t,0,4) then
	X =  0
	Y =  0 - t%6
	XX=  0
	yy=  0
elseif inrange(t,5,8) then
	X = -4 + (t%12)
	Y = -4
	XX=  4 - (t%12)
	YY=  0
elseif inrange(t,9,12) then
	X =  4
	Y = -4 + (t%8)
	XX= -4
	YY=  0
elseif inrange(t,13,16) then
	X =  4 
	Y =  0
	XX= -4
	YY= - (t%6)
elseif inrange(t,17,20) then
	X = 4 - (t%8)
	Y = 0
	XX= -4 + (t%8)
	YY= -4
elseif inrange(t,21,23) then
	X = 0
	Y = 0
	XX= 0
	YY= -4 + t%4
end

return
(x-2+X)^2+(y+2+Y)^2+z^2 <= 3 and YELLOW or
(x+2+XX)^2+(y+2+YY)^2+z^2 <= 3 and LIGHTGREEN
