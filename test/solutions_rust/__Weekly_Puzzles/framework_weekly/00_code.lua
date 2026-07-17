-- Connect the left and right ends of the x-axis,
-- then do the same for the y, z axes,
-- and it's frame!
if x == 0 or y == 0 or z == 0 then return end
local v = x^2+y^2+z^2 
return (v==6 or v==11) and LIGHTBLUE or v==3 and WHITE