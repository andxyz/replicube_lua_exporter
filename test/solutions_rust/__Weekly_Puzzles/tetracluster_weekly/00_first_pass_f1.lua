--first_pass
--210
--43.359
local min_x_y_z=min(x,y,z)
local max_x_ny_z=max(x,-y,z)
local max_x_ny_nz=max(x,-y,-z)
local min_x_y_nz=min(x,y,-z)
local xpypz=x+y+z
local xmypz=x-y+z
local xpymz=x+y-z
local xmymz=x-y-z
return 
(
	xpypz==-8 and min_x_y_z==-8 or
	xmypz==8 and max_x_ny_z==8 or
	y==8 and x==z
) and RED
or
(
	xpypz==-4 and min_x_y_z==-4 or
	xmypz==4 and max_x_ny_z==4 or
	y==4 and x==z and x<4 and x>-4
) and YELLOW
or
(
	xpymz==-6 and min_x_y_nz==-6 or
	xmymz==6 and max_x_ny_nz==6 or
	y==6 and x==-z and x<6 and x>-6
) and ORANGE
or
(
	xpymz==-2 and min_x_y_nz==-2 or
	xmymz==2 and max_x_ny_nz==2 or
	y==2 and x==-z and x<2 and x>-2
) and LIGHTGREEN