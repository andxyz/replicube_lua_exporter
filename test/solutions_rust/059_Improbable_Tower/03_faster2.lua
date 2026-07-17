--75
--8.966
if y==-4 then return GREY end
local yy=(y+4)%4
if
((z==-2 and yy==1) or (z==2 and yy==3)) and x<=3 and x>=-3 or
((x==-2 and yy==2) or (x==2 and yy==0)) and z<=3 and z>=-3
then
return BROWN
end
