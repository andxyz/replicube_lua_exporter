-- They Might Be Giants main 2 members
-- are John Linnel and John Flansburg.

-- Flansburg plays the guitar and is the more
-- outgoing performer of the two, often writing
-- more performance-oriented songs. 

-- Great example:
--'Youth Culture Killed My Dog' from their
-- self-titled debut album

-- couldnt find a very good teardrop so tons of touchup

--  Voxel Teardrop Shader Function
--  @param x, y, z : The current voxel coordinates
--  @param h : Total height of the drop (along Z-axis)
--  @param a : Maximum width factor (radius scale)
--  @returns boolean : true if the voxel is inside the drop
local function isInsideTeardrop(x, y, z, h, w)
    -- Normalize Z to a 0.0 to 1.0 range
    local nZ = z/h
    -- Bounds check: only calculate if within height limits
    if nZ < 0 or nZ > 1 then return false end

    -- Teardrop Equation (Surface of Revolution)
    -- r^2 = a^2 * z^2 * (1 - z)
    -- Higher powers of z (e.g., z^3) make the tip sharper.
    local rSq = (w^2) * (nZ^4) * (1 - nZ) -- radiusSq
    local cdSq = (x)^2 + (y)^2 -- currentDistSq

    return round(cdSq) - floor(rSq) <= 0
end

local color = y>0 and BROWN or z<-1 and BROWN or ORANGE

if z==0 and x==0 and y*y<=49 then return BLACK end
if inrange(z,-3,-1) then
	local X=x*x
	-- body touchups via excludes and includes
	if z==-2 then	
		if y==-1 and X==1 then return end
		if y==-7 and X<=1 then return end
		if y==2 and x==0 then return color end
	end	
	if z==-3 and y==1 and x==0 then return end
	if y==1 and X==1 then return end
	-- touchups
	if y==-1 and X==4 then return color end
	if y==-3 and X==4 then return color end
	if y==-8 and X<=1 then return color end
	
	-- top thingy
	if z==-1 then
		if (y==8 or y==6) and X<=1 or (y==7 and x==0) then return color end 
	end
	
	-- most of the body
	if z==-1 and isInsideTeardrop(z+1, x, -y+6, 14, 12) then
		if x==0 and inrange(y,-6,-4) then return end
		if y==-5 and X<=1 then return end
  	return color
	end
	if z==-2 and isInsideTeardrop(z+1, x, -y+6, 14, 12) and
		not isInsideTeardrop(z+1, x, -y+3, 10, 11) then	
  	return color
	end
	if z==-3 and isInsideTeardrop(z+2, x, -y+6, 14, 12) then	
  	return color
	end
end