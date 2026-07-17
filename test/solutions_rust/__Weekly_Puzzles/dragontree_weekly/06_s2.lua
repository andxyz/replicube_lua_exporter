--s2
--92
--55.571
level= 8
repeat
	t= {abs(x),abs(z)} sort(t)
	x,z= unpack(t)
	if y<=0 then
--		print("x="..x..", z="..z..", level="..level)
		return
			x==z*y
			and z<=level
			and (level~=1 or x%4==z%4)
			and ({LIGHTGREEN,GREEN,RED,ORANGE,RED,RED,RED,BROWN})[level]
	end
	z= z-level
	level= level//2
	y= y-level
until level<1  
