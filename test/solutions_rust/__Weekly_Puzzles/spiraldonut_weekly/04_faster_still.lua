--163
--9.020
-- Exclude empty space
if x|z>0 or y*y>=16 then return end
-- poormans max() function
local X,Z=x*x,z*z
local mx = X>Z and X or Z 
-- Exclude timbit hole
if mx <= 3 then return end
-- Exclude the different inner hollows, per each layer
-- note: the more we exclude the faster we go
if y==3 and (mx<=49) then return
elseif y==-2 and (mx==9 or mx==16 or mx==25 or mx==36 or mx==49) then return
elseif y== 1 and (mx==9 or mx==16 or mx==25 or mx==49) then return
elseif y== 0 and (mx==9 or mx==25 or mx==49) then return
elseif y==-1 and (mx==9 or mx==49) then return
elseif y== 2 and (mx==49) then return
end
-- .: !!??voxel cronuts mustn't be real??!!
-- .:   we are one with the squar'd croissanted toroid
-- .:   bless'ed are the cheesemakers!!!
-- .:   we must be be as crispy as a croissant!!!
return YELLOW -- wait, what? no chocolate?
