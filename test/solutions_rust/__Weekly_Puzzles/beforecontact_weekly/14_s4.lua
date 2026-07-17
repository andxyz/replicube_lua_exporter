--182
--63.931
X=x*x
Y=y*y
Z=z*z
A=X+Z
Q=(x+12)^2
K=(z-12)^2
R=x-2*y
P=A-196
T=X+(z+12)^2-196
return R>=0 and R<=1 and (P>=-97 and P<=-54 and DARKBROWN or P>=-54 and P<=0 and BROWN) or 
round(sqrt(X+Y+Z))<=7 and GREEN or 
Q+(y-4)^2+K<=3 and PINK or 
y==4 and Q+K>=9 and Q+K<=16 and BROWN or 
(x-6)^2+(y-7)^2+Z<=1 and GREY or 
y>7 and x+1==y and T>=-28 and T<=0 and ORANGE