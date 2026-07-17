-- assassin game where blending in
-- and not being noticed is just as
-- important as actually doing
-- the deed.

-- there could be so many fun disguises!

local ax = abs(x)
local eyez = abs(y - 2)

local c = 0

if z == 1 then
  local fd = max(abs(abs(x) - 2), eyez)
  if fd == 1 then c = 3 end
  if fd == 0 then c = 1 end
  if x == 0 and eyez == 0 then c = 3 end
end

if abs(x) == 3 and z < 2 then
  local fv = 0 - step(-2, z)
  if y - fv == 2 then c = 3 end
end

local nt = z + y + ax
if nt < 3 and y > -2 and z > 0 then c = 9 end

if y < -1 and z == 1 then
  c = 3
  if abs(x) == 3 and y == -3 then c = 0 end
end

return c
