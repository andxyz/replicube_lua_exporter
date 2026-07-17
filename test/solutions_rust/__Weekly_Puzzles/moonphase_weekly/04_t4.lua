--test4
if z<-1 or z>1 then return end
for a= 0,7,pi/4 do
  local voxelX= round(5 * sin(a))
  local voxelY= round(5 * cos(a))
  if
		inrange(x,voxelX-1,voxelX+1) 
		and inrange(y,voxelY-1,voxelY+1) then
		print("a="..a.." x="..x)
		local at= a+(t*pi/4)
		return (x-voxelX)*cos(at)-z*sin(at)+2.5
	end
end
