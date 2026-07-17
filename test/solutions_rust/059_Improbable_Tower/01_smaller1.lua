if y == -4 then return 2 end
yy=(y+4)%4
d=2
X=x*x<=9
Z=z*z<=9
a = (x==d and Z and 1 or 0)  * (yy==0 and 1 or 0)
b = (z==-d and X and 1 or 0) * (yy==1 and 1 or 0)
c = (x==-d and Z and 1 or 0) * (yy==2 and 1 or 0)
d = (z==d and X and 1 or 0)  * (yy==3 and 1 or 0)
return (a+b+c+d)*15
