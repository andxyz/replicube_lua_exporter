-- 164
--7.722
if y<=-4 then return BROWN end
if y==-3 then return GREEN end
if y==-2 then return LIGHTGREEN end
if y==5 then return LIGHTBLUE end
if y==4 then 
	if z>=-5 and z<=-4 and x>=-4 and x<=-1 then return WHITE end
	if z>=-1 and z<=0 and x>=-1 and x<=2 then return WHITE end
	if z>=4 and z<=5 and x>=1 and x<=4 then return WHITE end
end
if y==-1 then
	if z==-3 and x==1 then return YELLOW end
	if z==-2 and x==-3 then return PINK end
	if z==1 and x==-1 then return RED end
	if z==3 and x==4 then return ORANGE end
	if z==4 and x==0 then return PURPLE end	
end