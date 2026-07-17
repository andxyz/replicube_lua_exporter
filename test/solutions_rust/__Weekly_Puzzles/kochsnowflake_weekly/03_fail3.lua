local PI = 3.14159265
-- Koch Snowflake Shader for x + y + z = 0 plane
-- Returns 1 for "solid" and 0 for "empty"
function koch_voxel_shader(x, y, z, iterations, thickness)
    -- 1. Project (x,y,z) onto the plane x + y + z = 0
    -- Normal vector of the plane is n = (1, 1, 1) normalized
    local inv_sqrt3 = 0.57735026919
    local dist_to_plane = (x + y + z) * inv_sqrt3
    
    -- Check voxel thickness along the plane's normal
    if abs(dist_to_plane) > (thickness or 0.1) then 
        return 0 
    end

    -- Project 3D point to the plane surface
    local px = x - dist_to_plane * inv_sqrt3
    local py = y - dist_to_plane * inv_sqrt3
    local pz = z - dist_to_plane * inv_sqrt3

    -- 2. Define 2D basis vectors (u, v) on the x + y + z = 0 plane
    -- u-axis: (1, -1, 0) normalized
    -- v-axis: n cross u
    local ux, uy, uz = 0.70710678, -0.70710678, 0
    local vx, vy, vz = 0.40824829, 0.40824829, -0.81649658

    local u = px * ux + py * uy + pz * uz
    local v = px * vx + py * vy + pz * vz

    -- 3. Snowflake Fold Logic
    -- Reflect to take advantage of 6-fold symmetry
    local r = sqrt(u*u + v*v)
    local angle = atan(v, u)
    angle = (angle + PI/6) % (PI/3) - PI/6
    u, v = cos(angle) * r, sin(angle) * r

    -- Koch iteration (manual segment folding)
    local side = 4.0 -- Base triangle size
    u = u - side * 0.5
    
    -- Fold iterations
    for i = 1, (iterations or 5) do
        -- Plane-reflection: Fold across the 60-degree line
        -- Normal: (sin(60), -cos(60))
        local nx, ny = 0.8660254, -0.5
        local dot = u * nx + v * ny
        if dot > 0 then
            u = u - 2 * dot * nx
            v = v - 2 * dot * ny
        end
        
        -- Scale and shift for the next fractal level
        u = u * 0.5 - side
        v = v * 0.5
    end

    -- Return 1 if the point is inside the boundary
    return (u < 0) and 1 or 0
end

--return koch_voxel_shader(x, y, z, 7, 2) == 1 and 5
--return x+y+z==0 and 14 > max(x-y,y-z,z-x) and 1
