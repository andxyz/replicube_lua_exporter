-- Kinda tricky to communicate 'building'
-- in just a few voxels, but I think having the
-- windows lit up helped.

-- Notes:
-- make sure to peak inside, it helps
-- to see how the blue edges were made.

-- tower body
X=x*x
Z=z*z
if y<3 and X+Z < 9 then
	if X == Z then return DARKBLUE end
	if y%2 == 1 then return YELLOW end
	return DARKBLUE
end 
-- peak
if y>2 and X+Z < ((y-2)~3)^2 then 
	return DARKBLUE
end
