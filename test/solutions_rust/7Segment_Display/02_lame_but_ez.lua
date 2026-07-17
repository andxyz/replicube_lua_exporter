-- good luck!
--320
--104.575

-- presave the values in tables
-- left segments
c1={[0]=12, 12,12,12,7,7 ,7,12,7,7,7}
c2={[0]=12, 12,7,12,12,12 ,7,12,7,12,7}
-- middle segments
c3={[0]=12, 12,7,7,12,7 ,7,7,7,7,7}
c4={[0]=12, 12,7,7,7,7 ,7,12,7,7,12}
c5={[0]=12, 12,7,7,12,7 ,7,12,7,7,7}
-- right segments
c6={[0]=12, 7,7,7,7,12 ,12,7,7,7,7}
c7={[0]=12, 7,12,7,7,7 ,7,7,7,7,7}

-- empty space
if z==3 or z==4 or x==-4 then return end
-- not the display
if z~=2 then return BLACK end

if x==-1 then
  -- R 4 5 6 8 9 10
	if y==2  or y==1  then return c1[t] end -- c1
	-- R 2 6 8 10
	if y==-2 or y==-1 then return c2[t] end -- c2
end

if x==0 or x==1 then
	if y==3  then return c3[t] end -- c3
	if y==0  then return c4[t] end -- c4
	if y==-3 then return c5[t] end -- c5
end

if x==2 then
	if y==2  or y==1  then return c6[t] end -- c1
	if y==-2 or y==-1 then return c7[t] end -- c2
end

return BLACK