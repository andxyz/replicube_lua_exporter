--s3
--89
--54.571
--r=0
repeat
	t= {abs(x),abs(z)} sort(t)
	x,z= unpack(t)
	if y<=0 then
--		print("min"..x.." max"..z.." L"..ORANGE.."R"..r.."Y"..y)
		return
			x==z*y
			and z<=ORANGE
			and (ORANGE~=1 or x%4==z%4)
			and ({LIGHTGREEN,GREEN,RED,8,RED,RED,RED,BROWN})[ORANGE]
	end
	z= z-ORANGE
	ORANGE= ORANGE//2
	y= y-ORANGE
--	r=r+1
until ORANGE<1  
