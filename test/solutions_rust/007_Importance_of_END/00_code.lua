if y==0 or x==0 or z==0 then
	return WHITE
end

if x>1 and y>1 and z>1 then
	return LIGHTGREEN
end

if x<-1 and y<-1 and z>1 then
	return YELLOW
end

if x<-1 and y>1 and z<-1 then
	return RED
end

if x>1 and y<-1 and z<-1 then
	return BLUE
end