--s1
--122
--88.630
function cube(offset)
	return 
	max(abs(x+offset), abs(y+offset)) == 10 and abs(z+offset) == 10
	or max(abs(x+offset), abs(z+offset)) == 10 and abs(y+offset) == 10
end

Z=z%20
return (
	x%20==Z and y%20==Z and abs(y)>4
	or cube(6)
	or cube(-6)
) and x+y+z&1 | 10
