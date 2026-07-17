--s1
--140
--133.457
function tri(x,y,z,length)
	min_x_y_z= min(x, y,z)
	max_x_y_z= max(x,-y,z)
	xyz1= x+y+z
	xyz2= x-y+z
	return (
		xyz1==-length and min_x_y_z==-length or
		xyz2==length and max_x_y_z==length or
		y==length and x==z and x<length and x>-length
	) and 11-max(abs(x),abs(y),abs(z))/2
end

return
	  tri(x, y,  z, 8)
or	tri(x, y, -z, 6)
or	tri(x, y,  z, 4)
or	tri(x, y, -z, 2)
