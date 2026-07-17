--A hyperball before it begins rolling backward through 
--the X and T dimension.
--the ball colors match the distance to the 4D center.

--let's center t like the other dimensions:
t=t-5

--Use T like X Y and Z to transform this 3D scene into 4D!
local xt=x+t/2
local slope = y<=(xt-6)
local ball = (t^2+x^2+y^2+z^2)^.5
return (slope and xt or ball<4 and floor(ball))