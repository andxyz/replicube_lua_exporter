-- homage to this famous video
-- https://www.youtube.com/watch?v=-pdSjBPH3zM
--
-- 335
-- 41.700
-- see also:https://iquilezles.org/articles/distfunctions2d/
--
-- Box - exact
-- https://www.youtube.com/watch?v=62-pRVZuS5c
--
--float sdBox( in vec2 p, in vec2 b )
--{
--    vec2 d = abs(p)-b;
--    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
--}
--  p: Table {x, y, z} (Current sampling point)
--  b: Table {x, y, z} (Half-dimensions of the box)
--
--
-- Segment - exact
-- https://www.shadertoy.com/view/3tdSDj
-- https://www.youtube.com/watch?v=PMltMdi1Wzg
--
--float sdSegment( in vec2 p, in vec2 a, in vec2 b )
--{
--    vec2 pa = p-a, ba = b-a;
--    float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
--    return length( pa - ba*h );
--}
if y==-extent then return 15 end
if y==-extent+1 then return 11 end
if x*x>=16 then return end
--
-- Converting the above glsl to lua:
--

local function inigo_sdBox(px, py, bx, by)
    local dx, dy = abs(px) - bx, abs(py) - by
    local ex = sqrt(max(dx, 0)^2 + max(dy, 0)^2)
    local i = min(max(dx, dy), 0)
    
    return ex + i
end
local function inigo_sdSegment(px, py, pz, ax, ay, az, bx, by, bz)
    local pax, pay, paz = px - ax, py - ay, pz - az
    local bax, bay, baz = bx - ax, by - ay, bz - az

    local h = (pax*bax + pay*bay + paz*baz) / (bax*bax + bay*bay + baz*baz)
    h = max(0.0, min(1.0, h))
    
    local dx, dy, dz = pax - bax*h, pay - bay*h, paz - baz*h
    return sqrt(dx*dx + dy*dy + dz*dz)
end

if y==-3 or inrange(y,3,extent) then
	local xx = y==-3 and 3 or 6-y%6
	-- local zz=extent
	return inigo_sdBox(x,z,xx,extent) <= 0
end

if x~=0 or not inrange(z,-3,3) then
	local xx = x%2==0 and x or 0
	local zz = z%2==0 and z or 0
	return inigo_sdSegment(x,y,z,xx,-2,zz,xx,2,zz) <= 0
end
