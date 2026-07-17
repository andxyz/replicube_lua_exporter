-- good luck!
--
--
-- empty space
c1=(t>=4 and t~=7) and RED or DARKBLUE
c2=(t>0 and t%2==0 and t~=4) and RED or DARKBLUE

c3=LIGHTGREEN
c4=BLUE
c5=PURPLE

c6=PINK
c7=PEACH
if z==3 or z==4 or x==-4 then return end

if x==-1 then
	-- R 4 5 6 8 9 10
	if y==2  or y==1  then return c1 end -- c1
	-- R 2 6 8 10
	if y==-2 or y==-1 then return c2 end -- c2
end

if x==0 or x==1 then
	if y==3  then return c3 end -- c3
	if y==0  then return c4 end -- c4
	if y==-3 then return c5 end -- c5
end

if x==2 then
	if y==2  or y==1  then return c6 end -- c1
	if y==-2 or y==-1 then return c7 end -- c2
end

return BLACK