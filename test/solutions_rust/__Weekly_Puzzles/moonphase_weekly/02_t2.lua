--test2
function c(x,y,z,offset)
	return x*x+y*y+z*z <= 3 and
	shade(x,y,z,offset)
end

function shade(x,y,z,offset)	
	local a= (t+offset)*(pi/4)
	return clamp(2+round(x*cos(a))-round(z*sin(a)),1,3)
end

function c2(x,y,z)
end

for offset= 0,7,pi/4 do
	local a= (t+offset)*(pi/4)
	local v= clamp(-pi/8+(x*cos(a))+(z*sin(a)),-pi/2,pi/2)
	return ({WHITE,RED,BLUE,BLUE})[round(v+pi*3/4)]
end
