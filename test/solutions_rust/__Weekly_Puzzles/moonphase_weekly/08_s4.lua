--test4 became s4
for a= 0,7,pi/4 do
  px= round(5 * sin(a))
  py= round(5 * cos(a))
  if inrange(x,px-1,px+1) and inrange(y,py-1,py+1) and z*z<=1 then
		at= a+(t*pi/4)
		return (x-px)*cos(at)-z*sin(at)+2.5
	end
end
