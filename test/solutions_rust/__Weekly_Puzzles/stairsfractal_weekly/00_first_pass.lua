function f(scale, offset, offset2)
	return -(x-offset2)//scale -(y-offset)//scale -(z-offset)//scale
end
a = f(8,5,4)
b = f(8,1,0)
c = f(4,1,0)
d = f(2,1,0)
e = f(1,1,0)
return 
a >= 4 and 12 or
b==3 and c==4 and 13 or
c==3 and d==7 and 2 or
d==6 and e == 13
