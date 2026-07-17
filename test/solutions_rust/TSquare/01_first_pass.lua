function sdBox(px, py, pz, bx, by, bz)
    local dx = abs(px) - bx
    local dy = abs(py) - by
    local dz = abs(pz) - bz
    
    -- External part
    local mx = max(dx, 0.0)
    local my = max(dy, 0.0)
    local mz = max(dz, 0.0)
    local external = sqrt(mx * mx + my * my + mz * mz)
    
    -- Internal part
    local internal = min(max(dx, max(dy, dz)), 0.0)
    
    return external + internal
end

-- p = point position, b = box half-size, c = box center
function isCornerFromBox(px, py, pz, cx, cy, cz, bx, by, bz)
    local eps = 0.1 -- Tolerance for voxel centers
    
    -- Translate point to local space relative to center
    local localX = abs(px - cx)
    local localY = abs(py - cy)
    local localZ = abs(pz - cz)

    -- You are at a corner if you are at the limit of ALL axes
    if localX >= (bx - eps) and 
       localY >= (by - eps) and 
       localZ >= (bz - eps) then
        return true
    end
    return false
end

box1=sdBox(x+.5,y+.5,z+.5, 4,4,4)
box2=sdBox(x-3.5, y-3.5, z-3.5, 2, 2, 2)
box3=1

-- there is bad mod math here, taking a small break
-- PEACH boxes
if isCornerFromBox(x,y,z, 4,4,4, 0.5, 0.5, 0.5) then
	box2 = sdBox(x%8-3.5, y%8-3.5, z%8-3.5, 2, 2, 2)
end

-- GREY BOXES
if isCornerFromBox(x,y,z, 2,2,2, 0-3.5*x%8,0-3.5*y%8,0-3.5*z%8) then
	box3 = sdBox(x%4-1.5, y%4-1.5, z%4-1.5, 1, 1, 1)
end

-- TIME TO RENDER!!!
if min(box1,box2,box3) <=0 then
		return 
		box1<=0 and ORANGE or 
		box2<=0 and PEACH or
		box3<=0 and GREY	
end
