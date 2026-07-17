-- f2
-- 6434
-- 10.797
if y<-5 or y>5 then return end -- negative space
local X,Z=x*x,z*z
local XZ=X+Z
if XZ>=110 or XZ>=22 and XZ<=57 then return end -- negative space
if XZ<=21 then
	local Y=y*y
	--local in_neptune= origin_sphere <= 24
	--local in_core,inner_neptune= origin_sphere<=1, origin_sphere<=8
	local origin_sphere=X+Y+Z
	if origin_sphere <= 24 then
		if origin_sphere<=8 then 
			if origin_sphere<=1 then return BROWN end
			return LIGHTBLUE
		end
		if Y>4 then return BLUE end -- top and bottom of planet
		if y==-2 then -- slice1
			if x<0 then 
				if z>-1 and z<4 then return LIGHTBLUE end
			else
				if z<0 then return LIGHTBLUE end
			end
		end
		if y==1 then -- slice2
			if x>=0 then
				if z>=0 and z<4 then return LIGHTBLUE end
			else
				if z==4 then return LIGHTBLUE end
			end
		end
		if y==2 then -- slice3
			if x<0 then 
				if z<=-1 then return LIGHTBLUE end
			end
		end
		return BLUE
	end
end

if XZ<=20 then return end -- negative space above and below planet sphere

--local theta= 0.4014257 -- Angle of inclination of Triton's orbit in radians
--print("cos_theta=".. cos(theta) .. " sin_theta=" .. sin(theta))
--print("pi_12=".. pi/12)
--phi= t*pi/12
local phi= t*0.26179938779915
--local cos_theta= 0.92050486437677
--local sin_theta= 0.39073110275316
--Rotates point relative to the y-axis by phi

local px= 8*cos(phi)-5*sin(phi)
local pxSq= (x-px*0.92050486437677)^2
if pxSq>2 then return end
local pySq= (y-px*0.39073110275316)^2
if pySq>2 then return end -- negative space above and below the triton moon
local pzSq= (z-(8*sin(phi)+5*cos(phi)))^2
if pzSq>2 then return end

--local in_triton= pxSq + pySq + pzSq <= 2
if pxSq + pySq + pzSq <= 2 then 
	return GREY
end
