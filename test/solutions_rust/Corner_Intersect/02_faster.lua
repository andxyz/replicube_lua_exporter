--38
--15.192
local m = min(x, y, z)
local M = max(x, y, z)
--return (M==2 and minn<=-2)
--return (minn==-2 and M>=2)
return (M==2 and m<=-2) or (m==-2 and M>=2)
