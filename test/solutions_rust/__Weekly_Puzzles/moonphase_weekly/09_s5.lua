--s5
--70
--260.480
for a= 0,7,pi/4 do
  xpx= x-round(5 * sin(a))
  if xpx^2 + (y-round(5 * cos(a)))^2 + z*z <= 3 then
		at= a + t*.8
		return xpx*cos(at) - z*sin(at) + 2.5
	end
end
