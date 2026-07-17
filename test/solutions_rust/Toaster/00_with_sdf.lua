--641
--154.098
-- first pass with sdfs
--
-- p_x, p_y, p_z: current voxel coordinates
-- b_x, b_y, b_z: box half-extents (distance from center to face)
function sdBox(p_x, p_y, p_z, b_x, b_y, b_z)
    -- Calculate q (absolute distance from center minus half-extents)
    local q_x = abs(p_x) - b_x
    local q_y = abs(p_y) - b_y
    local q_z = abs(p_z) - b_z

    -- External distance: distance to box if point is outside
    -- Max(q, 0) components
    local mq_x = max(q_x, 0.0)
    local mq_y = max(q_y, 0.0)
    local mq_z = max(q_z, 0.0)
    local externalDist = sqrt(mq_x*mq_x + mq_y*mq_y + mq_z*mq_z)

    -- Internal distance: distance to nearest face if point is inside
    local internalDist = min(max(q_x, q_y, q_z), 0.0)

    return externalDist + internalDist
end
local function sdBox2d(px, py, bx, by)
    local dx, dy = abs(px) - bx, abs(py) - by
    local ex = sqrt(max(dx, 0)^2 + max(dy, 0)^2)
    local i = min(max(dx, dy), 0)
    
    return ex + i
end
local function sdSegment(px, py, pz, ax, ay, az, bx, by, bz)
    local pax, pay, paz = px - ax, py - ay, pz - az
    local bax, bay, baz = bx - ax, by - ay, bz - az

    local h = (pax*bax + pay*bay + paz*baz) / (bax*bax + bay*bay + baz*baz)
    h = max(0.0, min(1.0, h))
    
    local dx, dy, dz = pax - bax*h, pay - bay*h, paz - baz*h
    return sqrt(dx*dx + dy*dy + dz*dz)
end
-- px, py, pz: Current voxel coordinates
-- period: The horizontal distance before the wave repeats
-- amplitude: The height of the square step
-- offset_y: The base height of the wave
local function sdSquareWaveLine(px, py, pz, period, amplitude, offset_y, thickness)
    -- 1. Localize the horizontal position within one period [0, period]
    local x_mod = (fmod(px, period) + period) % period
    local half_p = period * 0.5
    
    -- 2. Vertical heights of the two horizontal segments
    local h_top = offset_y + amplitude
    local h_bot = offset_y
    
    -- 3. Distance to the Horizontal Segments
    -- Segment 1: The "High" flat (from x=0 to x=half_p)
    -- Segment 2: The "Low" flat (from x=half_p to x=period)
    local dist_h
    if x_mod < half_p then
        dist_h = abs(py - h_top)
    else
        dist_h = abs(py - h_bot)
    end
    
    -- 4. Distance to the Vertical Segments (The "Connectors")
    -- These occur at x_mod = 0 and x_mod = half_p
    -- We measure the distance to the closest vertical line segment
    local dx_v = min(x_mod, abs(x_mod - half_p), abs(x_mod - period))
    
    -- Bound the vertical line between the top and bottom heights
    local clamped_y = max(h_bot, min(py, h_top))
    local dy_v = py - clamped_y
    local dist_v = sqrt(dx_v * dx_v + dy_v * dy_v)
    
    -- 5. The final SDF is the distance to the closest part of the "wire" minus thickness
    return min(dist_h, dist_v) - thickness
end

local toaster,heating_elem,toaster_lever,toasts=1,1,1,1
--slots in the toaster
if y==1 and (z==1 or z==-1) and x*x<=9 then
else
	toaster = sdBox(x,y+2,z,4,3,3)
end

-- sdSquareWaveLine(px, py, pz, period, amplitude, offset_y, thickness)
heating_elem = (z*z==4 or z==0) and sdSquareWaveLine(x-1, y, z, 4, 4, -4,0.5) or 1

-- sdSegment(px, py, pz, ax, ay, az, bx, by, bz)
local magicP = t%4==0
local Ly = magicP and 0 or -4
toaster_lever = sdSegment(x, y, z, -5, Ly, -1, -5, Ly, 1)

-- sdBox2d(px, py, bx, by)
local Ty = magicP and -3 or 2
toasts = (z==1 or z==-1) and sdBox2d(x, y+Ty, 3, 2) or 1

return 
toasts<=0 and (t<3 and YELLOW or ORANGE) or
toaster<0 and heating_elem<=0 and (t<2 and BLACK or RED) or
toaster==0 and GREY or
toaster_lever<=0 and BLACK
