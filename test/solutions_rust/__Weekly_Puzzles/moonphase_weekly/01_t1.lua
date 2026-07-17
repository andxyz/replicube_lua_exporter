--test
function c(x,y,z,offset)
	return x*x+y*y+z*z <= 3 and
	shade(x,y,z,offset)
end

function shade(x,y,z,offset)	
	local a= (t+offset)*(pi/4)
	local v= clamp(-pi/8+(x*cos(a))+(z*sin(a)),-pi/2,pi/2)
	return ({WHITE,GREY,BLACK,BLACK})[round(v+pi*3/4)]
end

return c(x,y-5,z,0)