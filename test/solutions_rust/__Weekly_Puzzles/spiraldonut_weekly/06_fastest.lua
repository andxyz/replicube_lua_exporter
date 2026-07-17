--154
--8.044
-- Exclude empty space
-- note: order matters, the more we exclude the faster we go
if y>3 or y<-3 then return
elseif x|z>0 then return end
local mx = max(x*x,z*z)
-- Exclude the different inner hollows, per each layer
-- note: order matters, the more we exclude the faster we go
if y==3 and mx<=49 then return
elseif y==-2 and (mx==9 or mx==16 or mx==25 or mx==36 or mx==49) then return
elseif y== 1 and (mx==9 or mx==16 or mx==25 or mx==49) then return
elseif y== 0 and (mx==9 or mx==25 or mx==49) then return
elseif y==-1 and (mx==9 or mx==49) then return
elseif mx<=3 then return -- Exclude timbit hole
elseif y== 2 and mx==49 then return
end
-- .: !!??voxel cronuts mustn't be real??!!
-- .:   we are one with the squar'd croissanted toroid
-- .:   bless'ed are the cheesemakers!!!
-- .:   we must be as crispy as a croissant!!!
return YELLOW -- wait, what? no chocolate?
