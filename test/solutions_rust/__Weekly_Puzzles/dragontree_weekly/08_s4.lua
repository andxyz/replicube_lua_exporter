--s4
--85
--45.407
--r= 0
repeat
	repeat
		x,z= abs(z),abs(x)
	until x<=z
	if y<=0 then
--		print("min"..x.." max"..z.." L"..ORANGE.."R"..r.."Y"..y)
		return
			x==z*y
			and z<=ORANGE
			and (ORANGE~=1 or x%4==z%4)
			and ({LIGHTGREEN,GREEN,RED,8,RED,RED,RED,BROWN})[ORANGE]
	end
	z= z-ORANGE
	ORANGE= ORANGE/2
	y= y-ORANGE
--	r= r+1
until ORANGE<1  
