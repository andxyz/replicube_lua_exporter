local X,Y,Z=x*x,y*y,z*z
GOTIME=1
--391
--287.037
--
--float sdBox( vec3 p, vec3 b )
--{
--  vec3 q = abs(p) - b;
--  return length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0);
--}
function sdMengerBox(px, py, pz, size, holeWidth)
    -- Distance to the base Cube
    local adx = abs(px) - size
    local ady = abs(py) - size
    local adz = abs(pz) - size
    local dBox = max(adx, ady, adz)

    -- Define the cross-shaped holes (3 intersecting prisms)
    -- hole through X-Y (Z-axis opening)
    local hZ = max(abs(px) - holeWidth, abs(py) - holeWidth)
    -- hole through Y-Z (X-axis opening)
    local hX = max(abs(py) - holeWidth, abs(pz) - holeWidth)
    -- hole through Z-X (Y-axis opening)
    local hY = max(abs(pz) - holeWidth, abs(px) - holeWidth)

    -- subtract the holes from the box
    -- in SDFs, subtracting is, max(shape, -hole)
    local crossHoles = min(hZ, hX, hY)
    
    return max(dBox, -crossHoles)
end

local mbox1=1
local mbox2=1
local mbox3=1
local mbox4=1

mbox1=sdMengerBox(x, y, z, 4.5, 1.5) -- peach (center) box
mbox2=sdMengerBox(abs(x)-9, y, z, 4.5, 1.5) -- yellow boxes
mbox3=sdMengerBox(x, abs(y)-9, z, 4.5, 1.5) -- blue boxes
mbox4=sdMengerBox(x, y, abs(z)-9, 4.5, 1.5) -- green boxes

if GOTIME==1 then
	PURPLE=0
	PEACH=0
	YELLOW=0
	LIGHTBLUE=0
	GREEN=0
end

if X>16 and Y>16 or
	 X>16 and Z>16 or
	 Y>16 and Z>16 then return PURPLE end

if min(mbox1,mbox2,mbox3,mbox4) <=0 then
  return
  mbox1<=0 and PEACH or
  mbox2<=0 and YELLOW or
	mbox3<=0 and LIGHTBLUE or
	mbox4<=0 and GREEN		
end

-- This is the weird inner shape I discovered by mistake
local xx = abs(x)%3
local xxx = xx>=2 and 1 or xx
local yy = abs(y)%3
local yyy = yy>=2 and 1 or yy
local zz = abs(z)%3
local zzz = zz>=2 and 1 or zz

if xxx+yyy+zzz <=1 then
	return X<25 and Y<25 and Z<25 and WHITE or GREY
end
