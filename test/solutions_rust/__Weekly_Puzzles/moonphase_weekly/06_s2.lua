--s2
--76
--281.800

d= pi/4
for i= 0,7 do
	a= d*(t+i)
	xpx= round(x - 5*sin(i*d))
  if xpx^2 + (round(y - 5*cos(i*d)))^2 + z^2 <= 3 then
--    print("xpx="..xpx.." i="..i)
		return xpx*cos(a) - z*sin(a) + 2.5
	end
end
