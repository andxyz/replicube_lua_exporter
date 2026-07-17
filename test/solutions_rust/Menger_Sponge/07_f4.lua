--75
--19.56
local X,Y=x*x,y*y
if X<=1 and Y<=1 or
	 X<=1 and z*z<=1 or
	 Y<=1 and z*z<=1 then return end

--if y==0 and z==2 then
--	print("abs(x)%3/2: ".. abs(x)%3/2 .." ceil(x%3/2):".. ceil(x%3/2)) 
--end

if ceil(x%3/2) + ceil(y%3/2) + ceil(z%3/2) > 1 then
	return y+10
end
