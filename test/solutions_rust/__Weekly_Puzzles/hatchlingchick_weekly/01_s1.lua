-- 68
-- 16.659
X= x*x
sphere= X+y*y+z*z
return sphere<=5 and (
	X==1 and y==1 and z==1 and LIGHTBLUE or
	x==0 and y==0 and z==2 and ORANGE or
	YELLOW) or
	sphere<=12 and sphere>=7 and (y<0 or y>1)
