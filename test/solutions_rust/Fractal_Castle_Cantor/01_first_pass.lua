--234
--14.354

if y<=-9 then return BROWN end
local X,Z=x*x,z*z

if y>=-2 and (X<=16 or Z<=16) then return end
if y>=7 then return end

if y<=-3 then return X<=16 and Z<=16 and 0 or GREY end

local function calc_castle(x,y,z, level)
	local color=GREY

	if level==1 or level==2 or level==3 then
		if X<=16 or Z<=16 then color=0 end

		if level==2 or level==3 then 
			if X>=64 and X<=100 or Z>=64 and Z<=100 then color=0 end
			
			if level==3 then 
				if (X==36 or X==144) or (Z==36 or Z==144) then color=0 end
			end
		end
	end
	
	return color
end

if inrange(y,-2,0) then return calc_castle(x,y,z, 1) end
if inrange(y,1,3) then return calc_castle(x,y,z, 2) end
if inrange(y,4,6) then return calc_castle(x,y,z, 3) end
