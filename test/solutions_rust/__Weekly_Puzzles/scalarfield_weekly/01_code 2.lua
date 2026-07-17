if x == -3 and y == 3 and z == 5 then
	print(x*y*z//12)
	print(x*y*z/12)
	print(btoi(x*y*z/12==1))
	print(btoi(x*y*z/24==1))
	if 0 then
		print("zero is true")
	elseif 1 then
		print("one is true")
	end
end

return x*y*z//24==1
