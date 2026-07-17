--s1
--87
--11.958
t= y%4==y%8
return x*x+z*z<=9 and
(
	x*x==4 and y%4==0 and  BLUE+btoi(x<0 and t or x>0 and not t)
	or
	z*z==4 and x*sign(z)%4==(y-2)%4 and BLUE+btoi(z>0 and t or z<0 and not t)
)
