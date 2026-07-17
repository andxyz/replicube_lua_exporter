--250
--5.532

-- The turning light appears with the red light.
-- You can proceed in the direction of the arrow.
-- t = 0,1 LIGHTGREEN
--     2   YELLOW
--     3,4 RED + RIGHT ARROW
--     5   YELLOW
--     6,7 RED

local Y=y^2
if z<=-2 or z>=1 then return end
if Y>36 then return end

if Y<=36 then 
	if x<=2 and y<0 then return end -- missing sign pieces
	
	if z==0 then
		-- sign color function
		function color(sn,t) 
			if sn==1 and t<=1 then return LIGHTGREEN end
			if sn==2 and (t==2 or t==5) then return YELLOW end
			if sn==3 and (t>=3 and t~=5) then return RED end
			return BLACK
		end
		-- signs
		local YY=(y-3)^2
		local MAGIC=BROWN
		if (x+6)^2+YY<=7 then return color(1,t) end --sign num1
		if (x)^2+YY<=7 then return color(2,t) end --sign num2
		if (x-6)^2+YY<=7 then return color(3,t) end --sign num3
		if (x-6)^2+(y+3)^2<=7 then --sign num4
			if (t==3 or t==4) then 
				if y==-3 then return LIGHTGREEN end
				if x==6 and (y==-1 or y==-5) then return LIGHTGREEN end
				if x==7 and (y==-2 or y==-4) then return LIGHTGREEN end
				return BLACK
			else
				return BLACK
			end
		end
	end
	
	-- we are inside metalsign, return the color
	return WHITE 
end
