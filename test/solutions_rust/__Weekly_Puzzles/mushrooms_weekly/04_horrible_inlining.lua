--537
--9.497
-- HorribleHorrible inlining
-- inline function calls
-- simpler branches
-- remove max() calls
-- localize vars as much as possible

if z > 0 then
    if x < 0 then
        if y > 1 then return end
        if y <= -1 then
            if x == -3 and z == 3 then return PEACH end
            if y < -1 then return end
        end
        local dx, dz = x + 3, z - 3
        local X, Z = dx * dx, dz * dz
        if y == 1 then
            if X + Z <= 3 then return DARKBROWN end
        elseif y == 0 then
            local maxXZ = X > Z and X or Z
            if maxXZ == 4 then return DARKBROWN end
            if X + Z <= 3 then return BROWN end
        elseif y == -1 then
            if (X > Z and X or Z) == 4 then return BROWN end
        end
    elseif x > 0 then
        if y > -1 then return end
        if y <= -3 then
            if x == 3 and z == 3 then return PEACH end
            if y < -3 then return end
        end
        local dx, dz = x - 3, z - 3
        local X, Z = dx * dx, dz * dz
        if y == -1 then
            if X + Z <= 3 then return DARKBROWN end
        elseif y == -2 then
            local maxXZ = X > Z and X or Z
            if maxXZ == 4 then return DARKBROWN end
            if X + Z <= 3 then return BROWN end
        elseif y == -3 then
            if (X > Z and X or Z) == 4 then return BROWN end
        end
    end
elseif z < 0 then
    if x > 0 then
        if y > 3 then return end
        if y <= 1 then
            if x == 3 and z == -3 then return PEACH end
            if y < 1 then return end
        end
        local dx, dz = x - 3, z + 3
        local X, Z = dx * dx, dz * dz
        if y == 3 then
            if X + Z <= 3 then return DARKBROWN end
        elseif y == 2 then
            local maxXZ = X > Z and X or Z
            if maxXZ == 4 then return DARKBROWN end
            if X + Z <= 3 then return BROWN end
        elseif y == 1 then
            if (X > Z and X or Z) == 4 then return BROWN end
        end
    elseif x < 0 then
        if y > 5 then return end
        if y <= 3 then
            if x == -3 and z == -3 then return PEACH end
            if y < 3 then return end
        end
        local dx, dz = x + 3, z + 3
        local X, Z = dx * dx, dz * dz
        if y == 5 then
            if X + Z <= 3 then return DARKBROWN end
        elseif y == 4 then
            local maxXZ = X > Z and X or Z
            if maxXZ == 4 then return DARKBROWN end
            if X + Z <= 3 then return BROWN end
        elseif y == 3 then
            if (X > Z and X or Z) == 4 then return BROWN end
        end
    end
end


-- But I like my optimized first pass better than inlining all my functions :(
--
--function mushroom(x,y,z,dx,dz,topY)
--	-- empty space above
--	if y>topY then return end
--	
--	local X,Z=(x+dx)^2,(z+dz)^2
--	-- compute_stem
--	if y<=topY-2 then
--		-- stem
--		if x==-dx and z==-dz then return PEACH end
--		-- empty space around stem
--		if y<topY-2 then return end 
--	end
--	-- top
--	if topY==y and X+Z<=3 then return DARKBROWN end
--	-- middle
--	if topY-1==y then
--		if max(X,Z)==4 then return DARKBROWN end
--		if X+Z<=3 then return BROWN end
--	end
--	-- bottom
--	if topY-2==y and max(X,Z)==4 then return BROWN  end
--end
--
---- botleft
--if x<0 and z>0 then
--	return mushroom(x,y,z,3,-3,1) 
--end
---- botright
--if x>0 and z>0 then
--	return mushroom(x,y,z,-3,-3,-1) 
--end
---- topright
--if x>0 and z<0 then
--	return mushroom(x,y,z,-3,3,3)
--end
---- topleft
--if x<0 and z<0 then
--	return mushroom(x,y,z,3,3,5)
--end

