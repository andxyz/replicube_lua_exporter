-- codesize: 206
-- poormans rotations
Z=z^2
X1=x-2
X2=x+2
Y1=y-t+2
Y2=y+2
if t>=5 then
	if t<=8 then
	  X1=x-6+t
	  X2=x+6-t
		Y1=y-2
		Y2=y+2
	elseif t<=12 then
		X1=x+2
		X2=x-2
		Y1=y+t-10
		Y2=y+2
	elseif t<=16 then 
		X1=x+2
		X2=x-2
		Y1=y+2
		Y2=y+14-t
	elseif t<=20 then 
		X1=x+18-t
		X2=x+t-18
		Y1=y+2
		Y2=y+-2
	elseif t<=23 then 
		X1=x-2
		X2=x+2
		Y1=y+2
		Y2=y+t-22
	end
end

return X1^2+Y1^2+Z < 4 and YELLOW
 or X2^2+Y2^2+Z < 4 and LIGHTGREEN
