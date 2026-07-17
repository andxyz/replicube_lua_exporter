-- codesize: 140
-- 32.832
XY=x^2+y^2
XZ=x^2+z^2
YZ=y^2+z^2
c=(x+y+z)%2==1 and DARKBLUE or BLACK
return
XY+z*z<=3 and PINK or 
y==-2 and XZ<4 and x%2-z%2==0 and WHITE or
x==-2 and YZ<4 and z%2==1 and WHITE or
z==-2 and x==y and XY<4 and WHITE or
z==2  and XY==2 and WHITE or
y==2  and x==-z and XZ==2 and WHITE or
x==2  and YZ==0 and WHITE or
c