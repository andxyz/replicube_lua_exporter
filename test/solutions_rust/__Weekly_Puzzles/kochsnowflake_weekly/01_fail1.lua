-- 3D Koch IFS Fold Function
local function kochIFS(x, y, z, iterations)
    local scale = 3.0
    
    for i = 1, iterations do
        -- 1. Folding: Symmetry across the planes (x=y, y=z, z=x)
        -- This mirrors the point into the primary "chamber"
        if x < y then x, y = y, x end
        if y < z then y, z = z, y end
        if x < y then x, y = y, x end
        
        -- 2. IFS Transformation: Scale and Translate
        -- Scale the point up and shift it back to create the spike detail
        x = x * scale - (scale - 1.0)
        y = y * scale
        z = z * scale
        
        -- Optional: Add rotation here to create variation (e.g. Menger Sponge style)
    end
    
    return x, y, z
end

--return x+y+z==0 and kochIFS(x, y, z, 1) and 5
--return x+y+z==0 and 14 > max(x-y,y-z,z-x) 