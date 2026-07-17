-- Pushing the "run code" button is hilarious to me
-- my system absolutely chugs

-- empty space
if y<-9 or y>9 or z<-9 or z>9 then return end
-- maths
local a = (x+16-t)^2 + y^2 + z^2 - 50
local b = (x-16+t)^2 + y^2 + z^2 - 50
return (a + b - ((b - a)^2+6400)^.5)/2 < 0 and abs(x)+1

-- codesize: 94 (my lowest is 75)
-- cycles: 12.249
