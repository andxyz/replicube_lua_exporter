--206
--5.376

-- empty space
local Y=y^2
if z<=-2 or z>=1 then return end
if Y>36 then return end

-- the sign
if Y<=36 then 
	if x<=2 and y<0 then return end -- empty bot-left corner
	
	if z==0 then
		-- signs
		local YY=(y-3)^2
		local XX=(x-6)^2
		if (x+6)^2+YY<=7 then return t<=1 and LIGHTGREEN or BLACK end --sign num1
		if (x)^2+YY<=7 then return (t==2 or t==5) and YELLOW or BLACK end --sign num2
		if XX+YY<=7 then return (t>=3 and t~=5) and RED or BLACK end --sign num3
		if XX+(y+3)^2<=7 then --sign num4
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
