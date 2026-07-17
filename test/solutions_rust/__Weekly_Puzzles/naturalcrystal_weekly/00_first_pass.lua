--first_pass
--92
--14.749

--function f()
--	return -(x-1)//2 -(y+5)//1 -(z-4)//2
--end
--if f() >= 0 then return GREY end

if y>4 then return end -- negative space

if -(x-1)//2 -(y+5)//1 -(z-4)//2 >= 0 then return GREY end -- stairs

if x==z or x==-z then -- cross
	local X,Z= x*x,z*z
	if 
		y<=2 and X+Z==8
		or y==3 and X+Z==2
		or y==4 and X+Z==0
		then 
		return
		LIGHTBLUE
	end
end
