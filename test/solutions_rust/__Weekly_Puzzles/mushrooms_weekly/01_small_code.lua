-- 196
-- 34.715

-- calculate height of MushroomTop
local mushroomTop = -- -1,1,3,5 (or... zero means skip)
	z>0 and -sign(x) or
	z<0 and 4 - sign(x) or 0

if mushroomTop~=0 then
	local dx = x<0 and 3 or -3
	local dz = z<0 and 3 or -3
	
	function mushroom(x,y,z,dx,dz,topY)
		-- empty space above, bailout fast
		if y>topY then return end
		
		-- compute_stem
		if y<=topY-2 then
			-- stem
			if x==-dx and z==-dz then return PEACH end
			-- empty space around stem
			if y<topY-2 then return end 
		end

		local X,Z=(x+dx)^2,(z+dz)^2
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
	
	return mushroom(x,y,z,dx,dz,mushroomTop)
end
