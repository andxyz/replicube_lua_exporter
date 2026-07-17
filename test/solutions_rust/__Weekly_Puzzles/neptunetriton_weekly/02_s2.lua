-- s2
-- 189
origin_sphere=x*x+y*y+z*z 
--local in_neptune= origin_sphere <= 24
--local in_core,inner_neptune= origin_sphere<=1, origin_sphere<=8
if origin_sphere<=24 then
	if origin_sphere<=8 then 
		if origin_sphere<=1 then return BROWN end
		return LIGHTBLUE 
	end
	if y==-2 then --slice1
		if x<0 then 
			if z>-1 and z<4 then return LIGHTBLUE end
		else
			if z<0 then return LIGHTBLUE end
		end
	end
	if y==1 then --slice2
		if x>=0 then
			if z>=0 and z<4 then return LIGHTBLUE end
		else
			if z==4 then return LIGHTBLUE end
		end
	end
	if y==2 then --slice3
		if x<0 then 
			if z<=-1 then return LIGHTBLUE end
		end
	end
	return BLUE
end
--theta= 0.4014257 -- Angle of inclination of Triton's orbit in radians
--cos_theta=0.92
--sin_theta=0.3907
--local cos_theta,sin_theta,pi_12= 0.92050486437677, 0.39073110275316, 0.26179938779915
phi= t*pi/12
px= 8*cos(phi)-5*sin(phi)
if (x-px*.92)^2 + (y-px*.3907)^2 + (z-8*sin(phi)-5*cos(phi))^2 <= 2 then 
	return GREY
end
