-- with sdfs
--
--1385
--369.076
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
local function sdCircle2d(px, py, r)
    -- length(p) in 2D is the square root of (x^2 + y^2)
    return round(sqrt(px * px + py * py)) - r
end
local function sdBox2d(px, py, bx, by)
    local dx, dy = abs(px) - bx, abs(py) - by
    local ex = sqrt(max(dx, 0)^2 + max(dy, 0)^2)
    local i = min(max(dx, dy), 0)
    
    return ex + i
end
function sdOrientedBox(x, y, z, ax, ay, bx, by, th)
    -- 1. Get the length and direction of the segment (from point A to point B)
    local ab_x = bx - ax
    local ab_y = by - ay
    local l = sqrt(ab_x * ab_x + ab_y * ab_y)
    
    local dx = ab_x / l
    local dy = ab_y / l
    
    -- 2. Center the point relative to the box
    local qx = x - (ax + bx) * 0.5
    local qy = y - (ay + by) * 0.5
    
    -- 3. Apply the rotation matrix to align the point with the axis-aligned box
    -- GLSL mat2(d.x, -d.y, d.y, d.x) creates the following column-major matrix:
    -- [  dx,  dy ]
    -- [ -dy,  dx ]
    local rot_qx = dx * qx + dy * qy
    local rot_qy = -dy * qx + dx * qy
    
    -- 4. Get absolute bounds and subtract half-extents (length l, thickness th)
    qx = abs(rot_qx) - l * 0.5
    qy = abs(rot_qy) - th * 0.5
    
    -- 5. Calculate the final signed distance
    local max_qx = max(qx, 0.0)
    local max_qy = max(qy, 0.0)
    
    local exterior_dist = sqrt(max_qx * max_qx + max_qy * max_qy)
    local interior_dist = min(max(qx, qy), 0.0)
    
    return exterior_dist + interior_dist
end
-- a line segment
local function sdSegment(px, py, pz, ax, ay, az, bx, by, bz)
    local pax, pay, paz = px - ax, py - ay, pz - az
    local bax, bay, baz = bx - ax, by - ay, bz - az

    local h = (pax*bax + pay*bay + paz*baz) / (bax*bax + bay*bay + baz*baz)
    h = max(0.0, min(1.0, h))
    
    local dx, dy, dz = pax - bax*h, pay - bay*h, paz - baz*h
    return sqrt(dx*dx + dy*dy + dz*dz)
end

-- sdBox(p_x, p_y, p_z, b_x, b_y, b_z)
-- sdCircle2d(px, py, r)
-- sdBox2d(px, py, bx, by)
-- sdSegment(px, py, pz, ax, ay, az, bx, by, bz)

local circ=1
local plane=1
local segment1,segment2=1,1
local segment3,segment4=1,1
local frame_bridge=1
local boxes_1=1
local boxes_2=1
local boxes_3=1
local boxes_4=1

local Z=z*z

circ= Z==4 and sdCircle2d(x, y-2, 6) or 1
grass_plane=sdBox(x, y+9, z, 18/2, 1/2, 18/2)
--grass_plane= y==-9 and sdBox2d(x, z, 18/2, 18/2) or 1
segment1= Z==9 and sdSegment(x, y, z, -5, -8, z, 0, 2, z) or 1
segment2= Z==9 and sdSegment(x, y, z, -5, -9, z, 0, 1, z) or 1
segment3= Z==9 and sdSegment(x, y, z, 5, -8, z, 0, 2, z) or 1
segment4= Z==9 and sdSegment(x, y, z, 5, -9, z, 0, 1, z) or 1
local ferris_frame= min(circ,segment1,segment2,segment3,segment4)
frame_bridge= sdSegment(x, y, z, 0, 2, -2, 0, 2, 2) or 1

if grass_plane<=0 then return GREEN end -- grass
if ferris_frame==0 then return WHITE end -- legs and circles
if frame_bridge<=0 then return GREY end -- bridge between legs

local is_first_boxes = t%2==0
if is_first_boxes then
	--repetition formula ((x + (W / 2)) % W) - (W / 2)
  boxes_1= sdBox(x, ((y+6 + (12 / 2)) % 12) - (12 / 2), z, 3/2, 3/2, 3/2)
  boxes_2= sdBox(x+4, ((y+4 + (8 / 2)) % 8) - (8 / 2), z, 3/2, 3/2, 3/2)
  boxes_3= sdBox(x-4, ((y+4 + (8 / 2)) % 8) - (8 / 2), z, 3/2, 3/2, 3/2)
  boxes_4= sdBox(((x+6 + (12 / 2)) % 12) - (12 / 2), y, z, 3/2, 3/2, 3/2)
  
	if boxes_1<=0 then 
  	return ((x+1)//4 + (y)//4 + (y>0 and 5-t//2 or 4-t//2 ))%8 + 4
  end
  if boxes_2<=0 then 
  	return ((x+1)//4 + (y+1)//4 + (y>0 and 7-t//2 or 3-t//2))%8 + 4
  end
  if boxes_3<=0 then 
  	return ((x+1)//4 + (y+1)//4 + (3-t//2 ))%8 + 4
  end
  if boxes_4<=0 then 
  	return ((x)//4 + (y+1)//4 + (x<0 and 2-t//2 or 3-t//2 ))%8 + 4
  end
else -- the second frame of boxes
	--repetition formula ((x + (W / 2)) % W) - (W / 2)
  boxes_1= sdBox(x+2, ((y+6 + (12 / 2)) % 12) - (12 / 2), z, 3/2, 3/2, 3/2)
  boxes_2= sdBox(x-2, ((y+6 + (12 / 2)) % 12) - (12 / 2), z, 3/2, 3/2, 3/2)
  boxes_3= sdBox(((x-6 + (12 / 2)) % 12) - (12 / 2), y+2, z, 3/2, 3/2, 3/2)
  boxes_4= sdBox(((x+6 + (12 / 2)) % 12) - (12 / 2), y-2, z, 3/2, 3/2, 3/2)
  
  if boxes_1<=0 then
  	return (x//4 + y//4 + (y>0 and 6-t//2 or 4-t//2 ))%8 + 4
  end
  if boxes_2<=0 then
  	return (x//4 + y//4 + 4-t//2)%8 + 4
  end
  if boxes_3<=0 then
  	return (x//4 + y//4 + 3-t//2)%8 + 4
  end
  if boxes_4<=0 then
  	return (x//4 + y//4 + (x<0 and 9-t//2 or 3-t//2 ))%8 + 4
  end
end
