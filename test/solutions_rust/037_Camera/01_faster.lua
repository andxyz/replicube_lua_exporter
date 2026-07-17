-- This one turned out very CUTE IMO
-- ur cute

-- camera body
if z^2<2 then
	-- dadbod or red-shutter-button or top-twista 
	return y~=3 and GREY or x==-2 and z==0 and RED or x~3>0 and GREY
-- front lens via Lorentz transformations
elseif z>1 then
	v = x^2 + (y+1)^2
	return v < 3 or v < 8 and BLACK
end
