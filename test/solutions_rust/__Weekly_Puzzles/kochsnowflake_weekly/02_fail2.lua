-- Voxel Shader Function
-- px, py, pz: current voxel coordinates
-- Returns: distance to the fractal surface (negative = inside, positive = outside)
function voxel_shader(px, py, pz)
    local x, y, z = px, py, pz
    local iterations = 4
	  local scale = 1.0
    local iter_scale = 1.1
    local offset = 2.0
    
    for i = 1, iterations do
        -- 1. The max(x-y, y-z, z-x) tetrahedral fold
        -- This mirrors the voxel coordinate into the fundamental domain
        if x < y then x, y = y, x end
        if x < z then x, z = z, x end
        if y < z then y, z = z, y end

        -- 2. Scaling and Translation (The Koch "Expansion")
        -- This stretches space and shifts it to create the 4 smaller tetrahedra
        x = x * iter_scale - offset * (iter_scale - 1.0)
        y = y * iter_scale - offset * (iter_scale - 1.0)
        z = z * iter_scale
        
        -- Accumulate scale to normalize the distance at the end
        scale = scale * iter_scale
        
        -- 3. Additional Koch-specific fold on the Z-plane
        local z_limit = 0.5 * offset * (iter_scale - 1.0)
        if z > z_limit then
            z = z - offset * (iter_scale - 1.0)
        end
    end

    -- Return the signed distance to the base shape (a sphere/tetrahedron)
    -- We divide by 'scale' so the voxel engine knows the true distance
    local dist = (sqrt(x*x + y*y + z*z) - 1.5) / scale
    return dist
end
--Use code with caution.
--How to use this in a Voxel Loop:
--If you are generating a volume manually in Lua, 
--you would wrap the shader like this:lua
--local size = 64
--for x = -size, size do
--    for y = -size, size do
--        for z = -size, size do
--            -- Normalize coordinates to a -1.0 to 1.0 range
--            local d = voxel_shader(x/size, y/size, z/size)
--            
--            if d < 0 then
--                set_voxel(x, y, z, "snowflake_material")
--            end
--        end
--    end
--end

--return x+y+z==0 and voxel_shader(x/13,y/13,z/13) < 0 and 1