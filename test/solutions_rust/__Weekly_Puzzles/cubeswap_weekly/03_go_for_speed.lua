-- 233
-- 10.179

-- empty space
if z<-1 or z>1 or y<-3 or x<-3 or y>3 or x>3 then return end

-- bad maths
-- I couldnt get the cycle maths, I have failed you Anch, lol

local X1, X2, Y1, Y2 = x-2, x+2, y-t+2, y+2
if t>=5 then
	if t<=8 then X1, X2, Y1 = x-6+t, x+6-t, y-2
	elseif t<=12 then X1, X2, Y1 = x+2, x-2, y+t-10
	elseif t<=16 then X1, X2, Y1, Y2 = x+2, x-2, y+2, y+14-t
	elseif t<=20 then X1, X2, Y1, Y2 = x+18-t, x+t-18, y+2, y+-2
	elseif t<=23 then Y1, Y2 = y+2, y+t-22
	end
end

return X1^2+Y1^2+z^2 < 4 and YELLOW
 or X2^2+Y2^2+z^2 < 4 and LIGHTGREEN
