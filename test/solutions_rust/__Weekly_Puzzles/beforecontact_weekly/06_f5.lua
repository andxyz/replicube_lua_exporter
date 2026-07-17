--239
--14.028

--Hmm I thought the planet ring was a slanted elipse. Took me a while to find the right math
-- It appears to be a slice of a particular circle? Or am I wrong?

-- START early exits
if y>7 and x+2<y then return end

local X = x^2
local Z = z^2
local XZ = X + Z
local green_planet = XZ + y^2
local ring_slant = x - 2*y

if ring_slant >= 2 and green_planet >= 57 then return end
-- END early exits

-- green planet
if green_planet <= 56 then
  return GREEN
end

if ring_slant >= 0 and ring_slant <= 1 then
  local planet_ring = XZ - 196
  if planet_ring >= -97 and planet_ring <= -54 then
    return DARKBROWN
  elseif planet_ring >= -54 and planet_ring <= 0 then
    return BROWN
  end
end

-- pink moon
if y >= 2 and y <= 6 then
  local moon_ring = (x + 12)^2 + (z - 12)^2

  if moon_ring + (y - 4)^2 <= 3 then
    return PINK
  end

  if y == 4 and moon_ring >= 9 and moon_ring <= 16 then
    return BROWN
  end
end

-- comet
if y >= 6 and y <= 8 then
  if (x - 6)^2 + (y - 7)^2 + Z <= 1 then
    return GREY
  end
end

-- comet trail
if x+1 == y and y > 7 then
  local comet_trail = X + (z + 12)^2 - 196
  if comet_trail >= -28 and comet_trail <= 0 then
    return ORANGE
  end
end

--[[
btw, my first pass was this

-- green planet
local is_g_planet = round(sqrt(x^2 + y^2 + z^2)) <= 7
local ring_slant = x - 2*y
local planet_ring = x^2 + z^2 - 14^2 --14^2==196==2*98==4*49

-- pink moon
local is_p_moon = (x+12)^2 + (y-4)^2 + (z-12)^2 <= 3
local moon_ring = (x+12)^2 + (z-12)^2

-- comet
local is_comet = (x-6)^2 + (y-7)^2 + (z)^2 <= 1
local comet_trail = x^2 + (z+12)^2 - 14^2
local is_comet_slant = x+1 == y

return
inrange(ring_slant,0,1) and inrange(planet_ring,-97,-54) and DARKBROWN
or
inrange(ring_slant,0,1) and inrange(planet_ring,-54,0) and BROWN
or
is_g_planet and GREEN
or
is_p_moon and PINK
or
y==4 and inrange(moon_ring,9,16) and BROWN
or
is_comet and GREY
or
y>7 and is_comet_slant and inrange(comet_trail,-28,0) and ORANGE

]] --
