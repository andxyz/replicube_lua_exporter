--204
--159.964
--
--float sdBox( vec3 p, vec3 b )
--{
--  vec3 q = abs(p) - b;
--  return length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0);
--}
local function sdBox(px, py, pz, bx, by, bz)
	local dx = abs(px) - bx
	local dy = abs(py) - by
	local dz = abs(pz) - bz
	
	-- external part
	local mx = max(dx, 0.0)
	local my = max(dy, 0.0)
	local mz = max(dz, 0.0)
	local external = sqrt(mx * mx + my * my + mz * mz)
	
	-- internal part
	local internal = min(max(dx, dy, dz), 0.0) 
	return external + internal
end

-- boxes boxes everywhere
local box1=sdBox(x+.5,y+.5,z+.5, 4,4,4)
local box2=sdBox(x%8-3.5, y%8-3.5, z%8-3.5, 2, 2, 2)
local box3=sdBox(x%4-1.5, y%4-1.5, z%4-1.5, 1, 1, 1)

-- bippity boppity boo
return
box1<=0 and ORANGE or
box2<=0 and PEACH or
box3<=0 and GREY
