--s3
--72
--303.848
for i= 0,7,pi/4 do
	it= i+t*pi/4
	xpx= round(x - 5*sin(i))
  if xpx^2 + (round(y - 5*cos(i)))^2 + z^2 <= 3 then
--    print("xpx="..xpx.." it="..it)
		return xpx*cos(it) - z*sin(it) + 2.5
	end
end
