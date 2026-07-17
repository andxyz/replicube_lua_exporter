--103
--7.283
if x<-1 or x>1 or z<-1 or z>1 or (x==0 and z==0) then return end -- empty space
if y==3 or y==-3 then return WHITE end
if (z==1 or z==-1) and x*sign(z)-1==y then return 7+7*btoi(z<0) end
if (x==1 or x==-1) and z*sign(x)-1==-y then return 7+7*btoi(x<0) end
