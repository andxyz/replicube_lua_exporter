-- empty space
if z>1 or z<-1 then return end
if y>2 then return end

-- figure out whice place, we are
local pl = 1
if x>1 then pl=3 elseif x<-1 then pl=2 end

-- trophys
if pl==1 and y>=0 then
	if y==0 then return 1 end --ledges
	if x==0 and z==0 and y<3 then return YELLOW end -- gold
	return -- empty space above ledge, around trophy
end
if pl==2 and y>=-1 then 
	if y==-1 then return 1 end --ledges
	if x==-3 and z==0 and y<2  then return GREY end -- silver
	return -- empty space above ledge, around trophy
end
if pl==3 and y>=-2 then
	if y==-2 then return 1 end --ledges
	if x==3 and z==0 and y<1  then return ORANGE end -- bronze
	return -- empty space above ledge, around trophy
end

-- everything else
return BROWN