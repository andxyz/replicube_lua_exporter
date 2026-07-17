-- codesize: 114
-- 23.416

-- Dice are universal. 
-- Dice are simple.
-- I want to make an entire roguelike
-- about going through dungeons, but
-- only using dice for all your attacks
-- and abilities.
local X,Y,Z=x*x,y*y,z*z
return 
y==-2 and X+Z<4 and x%2-z%2==0 and BLACK or
z==-2 and X+Y<4 and x%2==1 and BLACK or
x==-2 and z==y and Y+Z<4 and BLACK or
x==2  and Y+Z==2 and BLACK or
y==2  and x==-z and X+Z==2 and BLACK or
z==2  and X+Y==0 and BLACK or WHITE
