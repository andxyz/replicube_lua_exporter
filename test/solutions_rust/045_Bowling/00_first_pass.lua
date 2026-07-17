-- SQUARE BOWLING BALL ENDS UP
-- MORE LIKE SHUFFLEBOARD
if y>0 then return end
if y==-4 and x*x<=9 then return YELLOW end

if (x+z)%2==1 and abs(x)<-z then
	if y==-1 then return RED end
	if y<=0 then return WHITE end
end

if x>=1 and x<=2 and y<-1 and z>=2 and z<=3 then return BLACK end
