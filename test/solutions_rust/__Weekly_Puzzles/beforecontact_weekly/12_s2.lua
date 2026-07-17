--186
--71.157

--Hmm I thought the planet ring was a slanted elipse.
-- It appears to be a slice of a particular circle? Or am I wrong?

-- green planet
X=x*x
XZ=X+z*z
g = XZ + y^2 <= 56 -- is_green_planet
rs = x - 2*y -- ring_slant
pr = XZ - 196 --14^2==196==2*98==4*49 -- planet_ring
X2=(x+12)^2
Z2=(z-12)^2
-- pink moon
m = X2 + (y-4)^2 + Z2 <= 3 -- is_pink_moon
mr = X2 + Z2 -- moon_ring

-- comet
c = (x-6)^2 + (y-7)^2 + z*z <= 1 -- is_comet
ct = X + (z+12)^2 - 196 -- comet_trail
cs = x+1 == y -- comet slant

return
-- planet
g and GREEN
or 
rs>=0 and rs<=1 and (pr>=-97 and pr<=-54 and DARKBROWN or pr>=-54 and pr<=0 and BROWN)
-- moon
or
m and PINK
or 
y==4 and mr>=9 and mr<=16 and BROWN
or 
-- comet
c and GREY
or
y>7 and cs and ct>=-28 and ct<=0 and ORANGE
