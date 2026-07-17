--237
--10.967
if y>=7 then return end -- bailout early on empty space
if y<=-9 then return BROWN end -- predefined things before the fractal gets started
local X,Z=x*x,z*z
-- predefined things before the fractal gets started
if y<=-3 then if X<=16 and Z<=16 then return 0 else return GREY end end
-- bailout early on empty space
if y>=-2 and (X<=16 or Z<=16) then return end

-- Our fun little cantor castle
-- given the x,y,z and the recusion level, compute the color
local function calc_castle(x,y,z, level)
	local c=GREY -- color

	if level==1 or level==2 or level==3 then
		if X<=16 or Z<=16 then c=0 end

		if level==2 or level==3 then 
			if X>=64 and X<=100 or Z>=64 and Z<=100 then c=0 end
			
			if level==3 then 
				if (X==36 or X==144) or (Z==36 or Z==144) then c=0 end
			end
		end
	end
	
	return c
end

-- run our poormans castle recursion per each level
if y>=-2 and y<=0 then return calc_castle(x,y,z, 1) end
if y>=1 and y<=3 then return calc_castle(x,y,z, 2) end
if y>=4 and y<=6 then return calc_castle(x,y,z, 3) end
