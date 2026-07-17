--A hyperball before it begins rolling backward through 
--the X and T dimension.
--the ball colors match the distance to the 4D center.

--let's center t like the other dimensions:
nt=t-5
--Use T like X Y and Z to transform this 3D scene into 4D!

return min(sqrt(nt*nt+x*x+y*y+z*z), 4)%4