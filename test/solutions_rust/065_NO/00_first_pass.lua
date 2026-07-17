--[[ 
remember, the definition of a circle is just 'all 
points that are a distance of r (radius) away from 
the origin'. So, to make a circle, we need to know 
the _distance_ for the given voxel from some origin 
(center point), and if that distance is a certain value,
or in a certain range, it lies on a circle.

so, how do you calculate distance? That's where Pythagoras
comes back!  Imagine we are currently at the voxel x=4 and y=3
and we want to know our distance from the origin:
				* <- voxel at (4,3)
			/ |
C=?  /  | y=3
		/   | 
	+-----+
	 x=4

This is basically a 'right triangle', which means:
x^2 + y^2 = C^2 (x squared plus y squared = c squared)
(4)^2 + (3)^2 = C^2
 16 + 9 = C^2
 25 = C^2
 sqrt(25) = C
 5 = C

in this simple example the distance is 5.

try playing with the numbers below to see how it works
outputing a number as a color helps you visualize patterns
nicely!
--]]
if z==0 then
	local c = round((x^2 + y^2)^.5)
	if c <= 3 then 
		if x==y then return RED end
		return WHITE
	elseif c <= 4 then return RED end
end