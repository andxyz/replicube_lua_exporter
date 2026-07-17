--f2
--139
--17.339
-- outer box
if x==-4 then x=4 end
if y==-4 then y=4 end
if z==-4 then z=4 end

if x==4 and z==4 or x==4 and y==4 or y==4 and z==4 then
	return WHITE
end
-- inner thingy
if y==0 and z==0 or x==0 and z==0 or x==0 and y==0 then 
	return RED
end
if y==-2 and z==-2 or x==-2 and z==-2 or x==-2 and y==-2 then
	return LIGHTGREEN
end
if y==2 and z==2 or x==2 and z==2 or x==2 and y==2 then
	return LIGHTBLUE
end
