X,Y,Z=x*x,y*y,z*z
origin_sphere=X+Y+Z 
--local in_neptune= origin_sphere <= 24
--local in_core,inner_neptune= origin_sphere<=1, origin_sphere<=8
if origin_sphere <= 24 then
	if origin_sphere<=8 then 
		if origin_sphere<=1 then return BROWN end
		return LIGHTBLUE 
	end
	if Y>4 then return BLUE end
	if y==-2 then
		if x<0 then 
			if z>-1 and z<4 then return LIGHTBLUE end
		else
			if z<0 then return LIGHTBLUE end
		end
	end
	if y==1 then
		if x>=0 then
			if z>=0 and z<4 then return LIGHTBLUE end
		else
			if z==4 then return LIGHTBLUE end
		end
	end
	if y==2 then
		if x<0 then 
			if z<=-1 then return LIGHTBLUE end
		end
	end
	return BLUE
end
--theta= 0.4014257 -- Angle of inclination of Triton's orbit in radians
theta= 0.401
--local cos_theta,sin_theta,pi_12= 0.92050486437677, 0.39073110275316, 0.26179938779915
phi= t*pi/12

--Rotates point relative to the y-axis by phi
px,py,pz= 8*cos(phi)-5*sin(phi), 0, 8*sin(phi) + 5*cos(phi)
--px,py,pz= px*cos(theta)-py*sin(theta), px*sin(theta)+py*cos(theta), pz -- z-axis by theta
--local in_triton= (x-px*cos_theta-py*sin_theta)^2 + (y-px*sin_theta+py*cos_theta)^2 + (z-pz)^2 <= 2
if (x-px*cos(theta)-py*sin(theta))^2 + (y-px*sin(theta)+py*cos(theta))^2 + (z-pz)^2 <= 2 then 
	return GREY
end
