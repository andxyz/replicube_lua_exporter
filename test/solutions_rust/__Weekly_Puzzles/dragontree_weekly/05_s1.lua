--s1
--98
--65.441
level= 8
c= {
	[1]=LIGHTGREEN,
	[2]=GREEN,
	[4]=ORANGE,
	[8]=BROWN
}
repeat
	t= {abs(x),abs(z)} sort(t)
	x,z= unpack(t)
	if y<=0 then
		return
--			print("x="..x..", z="..z..", level="..level)
			x==z*y
			and z<=level
			and (level~=1 or x%4==z%4)
			and c[level]
	end
	z= z-level
	level= level//2
	y= y-level
until level<1  
