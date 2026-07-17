-- slice-of-life school sim combined
-- with a fantasy RPG?

-- desk?
if y == -1 then return 15 end

local ZZZ=z*z
if (y == -2 or y==-7) and ZZZ<=36 then return 15 end

if abs(x)==extent and ZZZ<=36 and inrange(y,-extent,-3) then
	return 15
end

-- book?
if inrange(x,-6,0) and inrange(y,0,1) and inrange(z,-4,4) then
	if x==-6 then 
		return z%2==0 and 3 
	end
	return 1 + btoi(z%3==2)*13
end

-- pencil?
if y==0 and x==3 and inrange(z,-5,5) then
	if z==5 then return 3 end
	if z==4 then return 9 end
	if z==-4 then return 2 end
	if z==-5 then return 7 end
	return 8
end

-- eraser?
ez = abs(y+z)
if ez<=1 and inrange(y,0,1) and inrange(x,5,6) then
	return 5
end

-- book2?
bx = x + 2
by = y + 5
bz = z - 1
bb = max(-bx-2,abs(by))
if bx-2<3 and abs(bz)<5 then
	if bb ==1 then return 11 end
	if bb==0 and x<2 then return 1 end
end
