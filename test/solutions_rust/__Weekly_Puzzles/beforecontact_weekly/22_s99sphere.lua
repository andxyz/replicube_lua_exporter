function sphere_maybe(a,b,c)
	return (x+a)^2 + (z+b)^2 + (c<1 and (y+c)^2 or 0)
end
c=sphere_maybe
R=c(0,0,1)
return
c(0,0,0)<=56 and GREEN
--or y==x//2 and R>=99 and (R<=142 and DARKBROWN or R<=196 and BROWN)
or y==x//2 and R//-98==-2 and DARKBROWN-R//140
or c(12,-12,-4)<=3 
	and PINK
or y==4
	and c(12,-12,1)//-8==-2 and BROWN
or c(-6,0,-7)<2 
	and GREY -- comet
or y>7 and x==y-1 
	and c(0,12,1)//-28==-7 
	and ORANGE -- comet trail
