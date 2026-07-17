--f2
--80
--77.955
for i = 1, 3 do
	local v=max(abs(x),abs(y),abs(z))
	if v%2==0 and v>0 and x==(y%4==0==(y>0) and z or -z) and abs(x)<=abs(y) then
		return 11-v/2
	end
	x,y,z=y,z,x
end
