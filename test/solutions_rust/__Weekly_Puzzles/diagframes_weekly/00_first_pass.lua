--first_pass
--174
--37.833
if x==y and x%2==0 then
	local sx= sign(x)
	return abs(x)==extent and WHITE
		or sx==1 and LIGHTBLUE
		or sx==0 and RED
		or sx==-1 and LIGHTGREEN
end
if x==z and x%2==0 then
	local sz= sign(z)
	return abs(z)==extent and WHITE 
		or sz==1 and LIGHTBLUE
		or sz==0 and RED
		or sz==-1 and LIGHTGREEN
end
if y==z and y%2==0 then
	local sy= sign(y)
	return abs(y)==extent and WHITE
		or sy==1 and LIGHTBLUE
		or sy==0 and RED
		or sy==-1 and LIGHTGREEN
end
local X,Y,Z=abs(x),abs(y),abs(z)
if btoi(X==extent)+btoi(Y==extent)+btoi(Z==extent)>=2 then 
	return WHITE
end
