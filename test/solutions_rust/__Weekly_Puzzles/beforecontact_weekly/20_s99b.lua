--149
--42.819

G=x*x+z*z -- green planet
M=(x+12)^2+(z-12)^2 -- moon
C=sqrt(x*x+(z+12)^2) -- comet trail
return
G+y*y<57 and GREEN
or x-2*y&~1==0 and G>=99
	and (G<=142 and DARKBROWN or G<=196 and BROWN)
or M+(y-4)^2<=3 and PINK
or y==4 and M>=9 and M<=16 and BROWN
or (x-6)^2+(y-7)^2+z*z<2 and GREY -- comet
or y>7 and x==y-1 and C>=13 and C<=14 and ORANGE
