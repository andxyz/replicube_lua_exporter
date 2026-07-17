-- good luck!
local X,Y,Z=abs(x),abs(y),abs(z)
local maxXY,maxXZ,maxYZ=max(X,Y),max(X,Z),max(Y,Z)
return
maxXY==1 and maxXZ==1 and maxYZ==1 and BLACK or 
maxXY==2 and maxXZ==2 and maxYZ==2 and GREY or 
maxXY==3 and maxXZ==3 and maxYZ==3 and WHITE 
