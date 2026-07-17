--130
--23.231
if y==-extent then return 15 end
if y==-extent+1 then return 11 end
if x*x>=16 then return end
if y==-3 or inrange(y,3,extent) then
	local X,xx=x*x,y==-3 and 3 or 6-y%6
	if X<=xx*xx then return WHITE end
end

if y<3 and (x~=0 or not inrange(z,-3,3)) then
	local xx = btoi(x%2==0) * x
	local zz = btoi(z%2==0) * z
	if x==xx and z==zz then return WHITE end
end
