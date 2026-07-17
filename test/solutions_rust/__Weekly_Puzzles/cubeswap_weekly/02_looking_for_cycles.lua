--296
--12.097 but failing
-- empty space
local Z = z^2 if Z>1 or x^2>9 or y^2>9 then return end 

local T=-4*(t//5)+t%20
-- maths
local X1, X2, Y1, Y2 = 0, 0, 0, 0
if t<=4 then       X1, X2, Y1, Y2 = 0, x+2,       y-t+2, y+2
elseif t <= 8 then X1, X2, Y1, Y2 = 6-t, x+6-t,   y-2,   y+2
elseif t<=12 then X1, X2, Y1, Y2 =  4, x-2,       y+t-10, y+2
elseif t<=16 then X1, X2, Y1, Y2 =  4, x-2,       y+2,  y+14-t
elseif t<=20 then X1, X2, Y1, Y2 =  20-t, x+t-18, y+2,  y+-2
elseif t<=23 then X1, X2, Y1, Y2 =  0, x+2,       y+2,  y+t-22
end

if x==0 and y==0 and z==0 then
	print("T= " .. T)
	print(T)
end

return (x-2+X1)^2+Y1^2+Z <= 3 and YELLOW
or X2^2+Y2^2+Z <= 3 and LIGHTGREEN
