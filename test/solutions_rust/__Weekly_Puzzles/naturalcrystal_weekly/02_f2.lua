--f2
--125
--14.346
if y>4 then return end -- negative space

if -(x-1)//2 -(y+5)//1 -(z-4)//2 < 0 then
	if x>2 or z>2 or z<-2 or x<-2 then return end
	if x==z or x==-z then -- cross	
		if 
			y<=2 and (x==2 or x==-2 or z==2 or z==-2)
			or y==3 and (x==1 or x==-1 or z==1 or z==-1)
			or y==4 and (x==0 and z==0)
			then
			return
			LIGHTBLUE
		end
	end
	return
end 
return GREY -- stairs

--function f()
--	return -(x-1)//2 -(y+5)//1 -(z-4)//2
--end
--if f() >= 0 then return GREY end
