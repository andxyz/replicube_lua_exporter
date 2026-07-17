--207
--51.994

--Hmm I thought the planet ring was a slanted elipse.
-- It appears to be a slice of a particular circle? Or am I wrong?

-- green planet
local X=x*x
local XZ=X+z*z
local g = XZ + y^2 <= 56 -- is_green_planet
local rs = x - 2*y -- ring_slant
local pr = XZ - 196 --14^2==196==2*98==4*49 -- planet_ring

-- pink moon
local m = (x+12)^2 + (y-4)^2 + (z-12)^2 <= 3 -- is_pink_moon
local mr = (x+12)^2 + (z-12)^2 -- moon_ring

-- comet
local c = (x-6)^2 + (y-7)^2 + z*z <= 1 -- is_comet
local ct = X + (z+12)^2 - 196 -- comet_trail
local cs = x+1 == y --comet slant

return
rs>=0 and rs<=1 and pr>=-97 and pr<=-54 and DARKBROWN
or
rs>=0 and rs<=1 and pr>=-54 and pr<=0 and BROWN
or
g and GREEN
or
m and PINK
or 
y==4 and mr>=9 and mr<=16 and BROWN
or 
c and GREY
or
y>7 and cs and ct>=-28 and ct<=0 and ORANGE
