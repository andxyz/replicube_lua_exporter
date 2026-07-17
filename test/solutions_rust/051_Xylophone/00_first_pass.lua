local ax = abs(x)
local az = abs(z)

-- pipes
if y == 3 then
  if az < (x + extent + 1) // 6 + 3 then
		if ax < extent and x % 2 == 0 then
    	if az == 1 then
				return GREY
			else
				return ORANGE
    	end
		end
  end
end

-- base
if inrange(y, 0, 2) and ax < extent - 1 and az <= 1 then
  return BLACK
end

-- support-legs
if ax == extent - 2 and y < 0 then
  if y > -extent then
    if z == 0 then return BLACK end -- legs
  else
    if az < 4 then return BLACK end -- feet
  end
end

if ax == 2 and y == 6 and inrange(z, -3, 0) then
  if z == 0 then return BLACK end
  return YELLOW -- drumsticks
end
