-- s3
-- 169
phi= t*pi/12
origin_sphere= x*x+y*y+z*z
px= 8*cos(phi)+5*cos(phi+pi/2)
return 
origin_sphere<=1 and BROWN
or origin_sphere<=8 and LIGHTBLUE
or origin_sphere<=24 and BLUE + btoi(
	y==-2 and (x<0 and z>-1 and z<4 or x>=0 and z<0)
	or y==1 and (x>=0 and z>=0 and z<4 or x<0 and z==4)
	or y==2 and (x<0 and z<=-1)
)
or (x-px*9.2e-1)^2 
	 + (y-px*3.91e-1)^2 
	 + (z+8*cos(phi+pi/2)-5*cos(phi))^2 < 2 
	 and GREY
