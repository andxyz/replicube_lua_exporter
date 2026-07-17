-- Created with Gemini 3.1 Pro
--
-- Returns 1 if the voxel is on the spiral path, 0 otherwise
function square_spiral_shader(x, y)
    
    -- 1. RIGHT ARMS: x is positive and ODD (1, 3, 5...)
    -- Path flows Up. Spans from y = -(x - 1) to y = x + 1
    if x > 0 and x % 2 == 1 then
        if y >= -(x - 1) and y <= x + 1 then return 1 end
    end
    
    -- 2. TOP ARMS: y is positive and EVEN (2, 4, 6...)
    -- Path flows Left. Spans from x = -y to x = y - 1
    if y > 0 and y % 2 == 0 then
        if x >= -y and x <= y - 1 then return 1 end
    end
    
    -- 3. LEFT ARMS: x is negative and EVEN (-2, -4, -6...)
    -- Path flows Down. Spans from y = x to y = -x
    if x < 0 and x % 2 == 0 then
        if y >= x and y <= -x then return 1 end
    end
    
    -- 4. BOTTOM ARMS: y is zero or negative and EVEN (0, -2, -4...)
    -- Path flows Right. Spans from x = y to x = -y + 1
    -- When y = 0, this exactly colors (0,0) and (1,0) before handing off to the Right Arm.
    if y <= 0 and y % 2 == 0 then
        if x >= y and x <= -y + 1 then return 1 end
    end

    return 0
end

return 
square_spiral_shader(y,-x+1)~=0 and --xy
square_spiral_shader(z,-y+1)~=0 and --zy
square_spiral_shader(z,-x+1)~=0 and YELLOW --xz
