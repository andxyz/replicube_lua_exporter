--126
--5.465
-- empty space
if z>1 or z<-1 then return end
if y<=2 then
-- trophys
if x<-1 and y>=-1 then 
	if y==-1 then return WHITE end --ledge
	if x==-3 and z==0 and y<2  then return GREY end -- silver
	return -- empty space above ledge, around trophy
elseif x>1 and y>=-2 then
	if y==-2 then return WHITE end --ledge
	if x==3 and z==0 and y<1  then return ORANGE end -- bronze
	return -- empty space above ledge, around trophy
elseif x<=1 and x>=-1 and y>=0 then
	if y==0 then return WHITE end --ledge 
	if x==0 and z==0 and y<3 then return YELLOW end -- gold
	return -- empty space above ledge, around trophy
end
-- everything else
return BROWN
end