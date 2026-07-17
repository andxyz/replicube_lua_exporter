-- vector length 
function length(vx,vy,vz)
	return vx * vx + vy * vy + vz * vz
end

-- min function with blending (k modifies smoothness)
function smoothMin(a,b,k)
	k = k * 2.0
	i = b - a
	return 0.5 * (a + b - sqrt(i*i+k*k))
end

-- signed distance function returns the distance any point is 
-- from a shape of specified parameters
function signedDistanceSphere(px,py,pz, size)
	return length(px,py,pz) - size
end

-- distance functions can be used with min to allow for multiple objects to be drawn
return smoothMin(signedDistanceSphere(x + 9,y,z,30), signedDistanceSphere(x - 9,y,z,30), 40) < 0