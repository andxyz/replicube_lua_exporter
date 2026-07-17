-- s2
-- 109
-- 17.147
--local v1= (x+6)+abs(y-7)
--local v2= (x+6)+abs(y-6)
flag_v= x+x+12+abs(y+y-13)
return abs(z)>1 and 0 -- negative space
or x<-10 and 0 -- empty far left
or x<-7 and GREY -- flagpole sitter
or y>0 -- flag
and z==round(sin(pi/2+x-t*pi/4)) and (
	flag_v<20 and ({WHITE,WHITE,PINK,LIGHTBLUE,BROWN,BLACK})[floor((flag_v+4)/4+1)] -- v
 	or ({PURPLE,BLUE,GREEN,YELLOW,ORANGE,RED})[(y+1)//2] -- rainbow
)
