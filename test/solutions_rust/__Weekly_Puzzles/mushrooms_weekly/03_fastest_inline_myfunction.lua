-- inline the code from mushroom() function
-- 472
-- 11.247

-- Thats as far as I am willing to inline my function calls.

-- With function call to mushroom() was
-- 250
-- 19.802

-- botleft
if x<0 and z>0 then
	-- return mushroom(x,y,z,3,-3,1) 
	if y>1 then return end -- empty space above mushroom, bail out early
	-- compute_stem
  if y<=-1 then
  	-- stem
  	if x==-3 and z==3 then return PEACH end  	
  	-- empty space around stem, but below the mushroomtop
  	if y<-1 then return end
  end
  -- compute_mushroom_top
  local X,Z=(x+3)^2,(z-3)^2
  -- top
  if 1==y and X+Z<=3 then return DARKBROWN end
  -- middle
  if 0==y then
  	if max(X,Z)==4 then return DARKBROWN end
  	if X+Z<=3 then return BROWN end
  end
  -- bottom
  if -1==y and max(X,Z)==4 then return BROWN  end
end
-- botright
if x>0 and z>0 then
	-- return mushroom(x,y,z,-3,-3,-1) 
	if y>-1 then return end -- empty space above mushroom, bail out early
  -- compute_stem
  if y<=-3 then
  	-- stem
  	if x==3 and z==3 then return PEACH end
  	-- empty space around stem, but below the mushroomtop
  	if y<-3 then return end
  end  
  -- compute_mushroom_top
  local X,Z=(x-3)^2,(z-3)^2
  -- top
  if -1==y and X+Z<=3 then return DARKBROWN end
  -- middle
  if -2==y then
  	if max(X,Z)==4 then return DARKBROWN end
  	if X+Z<=3 then return BROWN end
  end
  -- bottom
  if -3==y and max(X,Z)==4 then return BROWN  end
end
-- topright
if x>0 and z<0 then
	-- return mushroom(x,y,z,-3,3,3)
	if y>3 then return end -- empty space above mushroom, bail out early
	-- compute_stem
  if y<=1 then
  	-- stem
  	if x==3 and z==-3 then return PEACH end
  	
  	-- empty space around stem, but below the mushroomtop
  	if y<1 then return end
  end
  
  -- compute_mushroom_top
  local X,Z=(x-3)^2,(z+3)^2
  -- top
  if 3==y and X+Z<=3 then return DARKBROWN end
  -- middle
  if 2==y then
  	if max(X,Z)==4 then return DARKBROWN end
  	if X+Z<=3 then return BROWN end
  end
  -- bottom
  if 1==y and max(X,Z)==4 then return BROWN  end
end
-- topleft
if x<0 and z<0 then
	-- return mushroom(x,y,z,3,3,5)
	if y>5 then return end -- empty space above mushroom, bail out early
	-- compute_stem
  if y<=3 then
  	-- stem
  	if x==-3 and z==-3 then return PEACH end
  	
  	-- empty space around stem, but below the mushroomtop
  	if y<3 then return end
  end
  
  -- compute_mushroom_top
  local X,Z=(x+3)^2,(z+3)^2
  -- top
  if y==5 and X+Z<=3 then return DARKBROWN end
  -- middle
  if 4==y then
  	if max(X,Z)==4 then return DARKBROWN end
  	if X+Z<=3 then return BROWN end
  end
  -- bottom
  if 3==y and max(X,Z)==4 then return BROWN  end
end

-- function mushroom(x,y,z,dx,dz,topY)
-- 	-- compute_stem
-- 	if y<=topY-2 then
-- 		-- stem
-- 		if x==-dx and z==-dz then return PEACH end
-- 		
-- 		-- empty space around stem, but below the mushroomtop
-- 		if y<topY-2 then return end
-- 	end
-- 	
-- 	-- compute_mushroom_top
-- 	local X,Z=(x+dx)^2,(z+dz)^2
-- 	-- top
-- 	if topY==y and X+Z<=3 then return DARKBROWN end
-- 	-- middle
-- 	if topY-1==y then
-- 		if max(X,Z)==4 then return DARKBROWN end
-- 		if X+Z<=3 then return BROWN end
-- 	end
-- 	-- bottom
-- 	if topY-2==y and max(X,Z)==4 then return BROWN  end
-- end