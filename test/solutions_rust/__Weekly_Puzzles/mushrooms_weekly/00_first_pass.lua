-- 229
-- 23.119

function mushroom(x,y,z,dx,dz,topY)
	-- empty space above
	if y>topY then return end
	
	local X,Z=(x+dx)^2,(z+dz)^2
	-- compute_stem
	if y<=topY-2 then
		-- stem
		if x==-dx and z==-dz then return PEACH end
		-- empty space around stem
		if y<topY-2 then return end 
	end
	-- top
	if topY==y and X+Z<=3 then return DARKBROWN end
	-- middle
	if topY-1==y then
		if max(X,Z)==4 then return DARKBROWN end
		if X+Z<=3 then return BROWN end
	end
	-- bottom
	if topY-2==y and max(X,Z)==4 then return BROWN  end
end

-- botleft
if x<0 and z>0 then
	return mushroom(x,y,z,3,-3,1) 
end
-- botright
if x>0 and z>0 then
	return mushroom(x,y,z,-3,-3,-1) 
end
-- topright
if x>0 and z<0 then
	return mushroom(x,y,z,-3,3,3)
end
-- topleft
if x<0 and z<0 then
	return mushroom(x,y,z,3,3,5)
end
