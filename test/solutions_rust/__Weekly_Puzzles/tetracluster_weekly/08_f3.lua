--f3
--62
--23.159
local v= max(abs(x),abs(y),abs(z))
local uv= v%4==0 and v or -v
return
v%2==0 and v>0
and (x*uv==y*z or y*uv==x*z)
and 11-v/2
