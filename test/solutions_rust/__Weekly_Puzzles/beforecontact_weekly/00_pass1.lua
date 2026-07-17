--Hmm ring... is an elipse? not a sphere slice?
-- or perhaps a slice of a particular circle?

local is_g_planet = round(sqrt(x^2 + y^2 + z^2)) <= 7
local is_slant = (x == 2*y or x-1 == 2*y)
local ring = x^2/14^2 + z^2/14^2
local ring2 = x^2 + z^2 - 14^2

--196
--98
--49
return 
is_slant and inrange(ring2,-97,-49) and BROWN
or
is_slant and inrange(ring2,-49,0) and DARKBROWN
or

is_slant and inrange(ring,.51,.7) and DARKBROWN
or
is_slant and inrange(ring,0.7,1) and BROWN
or
is_g_planet and GREEN
