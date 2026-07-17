--164
--8.338
-- Exclude empty space
-- note: order matters, the more we exclude the faster we go
if y*y>=16 then return
elseif x|z>0 then return end
-- poormans max() function, for fun
local X,Z=x*x,z*z
local mx = X>Z and X or Z 
-- Exclude the different inner hollows, per each layer
-- note: order matters, the more we exclude the faster we go
if y==3 and (mx<=49) then return
elseif y==-2 and (mx==9 or mx==16 or mx==25 or mx==36 or mx==49) then return
elseif y== 1 and (mx==9 or mx==16 or mx==25 or mx==49) then return
elseif y== 0 and (mx==9 or mx==25 or mx==49) then return
elseif y==-1 and (mx==9 or mx==49) then return
elseif mx <= 3 then return -- Exclude timbit hole
elseif y== 2 and (mx==49) then return
end
-- .: !!??voxel cronuts mustn't be real??!!
-- .:   we are one with the squar'd croissanted toroid
-- .:   bless'ed are the cheesemakers!!!
-- .:   we must be be as crispy as a croissant!!!
return YELLOW -- wait, what? no chocolate?
