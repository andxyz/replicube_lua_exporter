---Unseen blade strikes swift
---Bamboo remains unmoving
---Until it falls down

dx =t
dy =t+1

xx = (x - dx)
yy = (y + dy)
zz = z

if xx^2+zz^2 < 8 and xx^2+zz^2 ~= 0 then 
	return 13-yy < y and EMPTY
			or xx-yy>y and xx^2+zz^2 < 4 and YELLOW 
			or xx-yy>y and y%7 == 2 and GREEN 
			or xx-yy>y and LIGHTGREEN
end