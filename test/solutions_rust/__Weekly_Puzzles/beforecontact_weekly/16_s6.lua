WHITE=1
GREY=2
BLACK=3
PEACH=4
PINK=5
PURPLE=6
RED=7
ORANGE=8
YELLOW=9
LIGHTGREEN=10
GREEN=11
DARKBLUE=12
BLUE=13
LIGHTBLUE=14
BROWN=15
DARKBROWN=16
X=x*x
Z=z*z
A=X+Z
R=x-2*y
M=(x+12)^2+(z-12)^2
T=X+(z+12)^2
return A+y*y<57 and GREEN or
R>=0 and R<2 and A>98 and (A<143 and DARKBROWN or A<197 and BROWN) or
M+(y-4)^2<4 and PINK or
y==4 and M>8 and M<17 and BROWN or
(x-6)^2+(y-7)^2+Z<2 and GREY or
y>7 and x+1==y and T>167 and T<197 and ORANGE