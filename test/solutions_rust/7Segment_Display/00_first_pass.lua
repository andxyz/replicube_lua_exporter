-- good luck!
--
--
-- empty space

if z==3 or z==4 or x==-4 then return end
local Y=y*y
local nn = x==0 or x==1
if y%3~=0 and nn then return BLACK end
if (x==-1 or x==2) and (y%3==0 or Y==16)  then return BLACK end
if x<-1 or x>2 then return BLACK end

if z==2 then return PEACH end

return BLACK