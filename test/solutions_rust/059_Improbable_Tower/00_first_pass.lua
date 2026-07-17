-- This would be like some sort of physics
-- puzzle, where players take turns removing
-- pieces of a tower, trying not to be the
-- one that causes it to topple over.

-- might be better as a physical game
-- than a videogame? hmmm

if y == -4 then 
  return 2
end

local yy,d = (y+4)%4, 2
a = ((x==d and abs(z)<=d+1) and 1 or 0)  * (yy==0 and 1 or 0)
b = ((z==-d and abs(x)<=d+1) and 1 or 0) * (yy==1 and 1 or 0)
c = ((x==-d and abs(z)<=d+1) and 1 or 0) * (yy==2 and 1 or 0)
d = ((z==d and abs(x)<=d+1) and 1 or 0)  * (yy==3 and 1 or 0)

return (a+b+c+d)*15
