-- OK not the most accurate Penguin ever,
-- but still CUTE

-- Notes:
-- you might need to peek inside to get
-- the internal colors correct on this one.

if x^2 == 1 and y == 1 and z == 1 then return BLACK
elseif x^2 < 2 and z^2 < 2 and z>=0 and y^2 < 5 then return WHITE
elseif y==0 and x==0 and z==2 then return YELLOW
elseif x^2 < 5 and z^2 < 3 and y > -3 then return DARKBROWN
elseif x == 0 and y == -3 then
	return EMPTY
else 
	return x^2 < 5 and z^2 < 5 and z > -2 and y == -3 and DARKBROWN
end
