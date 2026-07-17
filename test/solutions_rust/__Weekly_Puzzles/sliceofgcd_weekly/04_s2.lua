function f(a,b,c)
	return c and f(f(a,b),c) or 
		b==0 and abs(a) or 
		f(b,a%b)
end
return t==z+8 and f(x-y, z-y, t)