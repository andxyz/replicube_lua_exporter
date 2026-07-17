dist = round(sqrt(x^2+y^2))				-- distance from the center for the beautiful circle shape
angle = atan(x,y)/pi+1						-- angle at each point in the circle scaled to be from 0 to 2
if t > 13 then T = 13-(t-13) end	-- we need to somehow change t to make it loop after it reaches 14
																	-- here I use T to not break our original t value so we can keep track of it
if z == -2 then return dist end
if z == 0 then return angle end
if z == 2 then return dist == 4 and angle <= (T or t)/6 and t/5+1 end
																	-- (T or t) uses the value T only if we defined it earlier, otherwise it uses t

-- good luck, you've got this :3