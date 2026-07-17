function cube(size)
	-- we create a cube by first checking if the maximum of all coordinates is at the size that we want
	-- we then check each coordinate seperately to detect if we're on an edge of the cube, and only then output true
	if max(abs(x),abs(y),abs(z)) == size then
		return btoi(abs(x)==size)+btoi(abs(y)==size)+btoi(abs(z)==size) > 1
	end
end
return cube(1) and RED or cube(3) and ORANGE or cube(5) and YELLOW