--324
--8.522

-- Hmm... at first I thought the planet ring was a slanted elipse.
-- Took me a while to find the right math
-- It appears to be a slanted slice of a particular circle? Or am I wrong?

-- early exits
if y<=-8 then return end
if y>=8 then
  -- comet trail and salt
  if x<=5 then return end -- early exit
  if z>=1 then return end -- early exit

  if x==6 then
    if y~=8 then return end
    if z~=0 then return end
    return GREY -- pinch of grey salt
  end

  -- comet trail, all the way across the sky
  if x+1~=y then return end
  if x>=7 then
    local z12=z+12
    local comet_trail=(x*x)+(z12*z12)-196
    if comet_trail>=-27 and comet_trail<=0 then
      return ORANGE
    end
    return -- early exit
  end
elseif y>=3 and x<=-8 then
  -- pink moon
  -- pink moon (perfect 3x3x3 cube, what does it mean?)
  if z>=11 and x>=-13 then
		if x<=-11 and y<=5 and z<=13 then
			return PINK
		end
  end

  -- moon ring, it's beautiful
  if y==4 and z>=8 then
    local x12=x+12
    local z12=z-12
    local moon_ring=(x12*x12)+(z12*z12)
    if moon_ring>=9 and moon_ring<=16 then
      return BROWN
    end
  end
  return -- early exit
end

local X=x^2
local Z=z^2
local XZ=X+Z
if x<=7 and x>=-7 and z<=7 and z>=-7 then
  if x+y<=11 then
    -- Chalmers: A green planet, localized entirely within your kitchen?
    local green_planet=XZ+(y*y)
    if green_planet<=56 then
      return GREEN
    end
  else
    -- Chalmers: A grey comet, may I see it?
    if y>=6 then
      local x6=x-6
      local y7=y-7
      if (x6*x6)+(y7*y7)+Z<=1 then
        return GREY
      end
    end
  end
else
  --  local ring_slant=x//2-y
  --	if ring_slant~=0 then return end
  if x//2~=y then return end
  local planet_ring=XZ-196
  if planet_ring<=0 then
    if planet_ring>=-52 then
      return BROWN
    elseif planet_ring>=-96 then
      return DARKBROWN
    end
  end
end

-- Skinner: No.

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
