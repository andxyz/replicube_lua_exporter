--test3
function c(x,y,z,offset)
	return x*x+y*y+z*z <= 3 and
	shade(x,y,z,offset)
end

function shade(x,y,z,offset)	
	local a= (t+offset)*(pi/4)
	return clamp(2+round(x*cos(a))-round(z*sin(a)),1,3)
end

--setup
local centerX,centerY,centerZ= 0,0,0
local numDots= 8
local angleStep= 2*pi/numDots
local radius=5
--run_loop
for offset= 0,7,pi/4 do
	local angle= offset
--for i= 0, numDots-1 do
--  local angle = i * angleStep -- Calculate the angle for the current dot
	local exactX= centerX + (radius * cos(angle))
  local exactY= centerY + (radius * sin(angle))
  local voxelX= floor(exactX + 0.5)
  local voxelY= floor(exactY + 0.5)
  local voxelZ= centerZ -- Since circle is on XY plane
	if inrange(x,voxelX-1,voxelX+1) and inrange(y,voxelY-1,voxelY+1) and inrange(z,-1,1) then
		return shade(x,y,z,offset)
	end
end
