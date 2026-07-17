local T, Z = t%24, z^2
local X1, X2, Y1, Y2 = 0, 0, 0, 0

if t<=4 then
	X1, X2 =  -2,  2
	Y1, Y2 =  2-t, 2
elseif t <= 8 then
	X1, X2 = t-6, 6-t
	Y1, Y2 =  -2, 2
elseif t<=12 then
	X1, X2 =    2, -2 
	Y1, Y2 = t-10, 2
elseif t<=16 then
  X1, X2 =   2, -2
	Y1, Y2 =   2, 14-t
elseif t<=20 then
	X1, X2 = 18-T, T-18
	Y1, Y2 = 2,    -2
elseif t<=23 then
	X1, X2 = -2, 2 
	Y1, Y2 =  2, t-22
end

if x==2 and y == -2 and z == 0 then 
 print("X1= " .. X1 .. ",Y1= " .. Y1) 
 print("X2= " .. X2 .. ",Y2= " .. Y2) 
end

return (x+X1)^2+(y+Y1)^2+Z<4 and YELLOW
 or (x+X2)^2+(y+Y2)^2+Z<4 and LIGHTGREEN