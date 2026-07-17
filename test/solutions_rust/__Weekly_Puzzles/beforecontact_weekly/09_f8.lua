--407
--8.646

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
  -- comet trail
	if x+1~=y then return end
  if x>=7 then
    local comet_trail=x*x+(z+12)^2-196
    if comet_trail>=-28 and comet_trail<=0 then
      return ORANGE
    end
		return -- early exit
  end
elseif y>=3 and x<=-8 then
  -- pink moon
  -- pink moon (perfect 3x3x3 cube, what does it mean?)
  if y>=3 and y<=5 then
    if x>=-13 and x<=-11 and z>=11 and z<=13 then
      return PINK
    end
  end

  -- moon ring math turned into if-else branches
  --	local moon_ring=(x+12)^2+(z-12)^2
  --  if y==4 and moon_ring>=9 and moon_ring<=16 then
  --    return BROWN
  --  end
  if y==4 then
    if z==12 and (x==-16 or x==-15 or x==-9 or x==-8) then
      return BROWN
    elseif (z==10 or z==11 or z==13 or z==14) and (x==-15 or x==-9) then
      return BROWN
    elseif (z==9 or z==15) and x>=-14 and x<=-10 then
      return BROWN
    elseif (z==8 or z==16) and x==-12 then
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
    -- Chalmers: a green planet, localized entirely within your kitchen?
    local green_planet=XZ+y^2
    if green_planet<=56 then
      return GREEN
    end
  else
    -- Chalmers: a grey comet, may I see it?
    if y>=6 and y<=8 then
      --  if (x-6)^2+(y-7)^2+Z<=1 then
      --    return GREY
      --  end
      if x==6 and y==7 and (z==0 or z==1 or z==-1) then
        return GREY
      elseif x==6 and z==0 and (y==6 or y==8) then
        return GREY
      elseif y==7 and z==0 and (x==5 or x==7) then
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
    if planet_ring>=-54 then
      return BROWN
    elseif planet_ring>=-97 then
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
