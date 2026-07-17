function gcd(a,b) return b==0 and a or gcd(b,a%b) end
return t==z+8 and gcd(gcd(x+8,y+8),t)

--[[
-- the 3params function added a few tokens

function f(a,b,c)
	return c and f(f(a,b),c) or 
		b==0 and abs(a) or 
		f(b,a%b)
end
return t==z+8 and f(x-y, z-y, t)
]]--
