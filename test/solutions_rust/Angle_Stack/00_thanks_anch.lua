-- make sure to peek inside to see
-- the priority for what color to
-- pick where things overlap.

--return ((x-1)//2+(y-1)//2+(z-1)//2) < 1 and BLUE

if abs(x-y)<=1 and abs(z-y)<=1 and abs(x-z)<=1 then 
	return clamp(min(x,y,z)+6,2,9)
end
