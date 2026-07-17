if z == 0 and y == 0 and abs(x) == 5-t then
 return WHITE
end
r = sqrt(x^2+y^2+z^2) -- radius of a sphere centered at (0,0,0)
index = (r-(t-10))//1.5 -- `//` divides without a remainder, so dividing by 1.5 gives us whole number "steps" that try their best to be 1.5 voxels large
if x < 1 then
	colors = {ORANGE, GREEN, BLUE}
	return colors[index]
end