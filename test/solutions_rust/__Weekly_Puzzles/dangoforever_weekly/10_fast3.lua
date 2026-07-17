--111
--10.745

--empty space
if y>=4 or y<=-4 then return end

-- setup x_component and y_component
local x_component= x>=3 and (x+abs(t-5)-10)^2 or x<=-3 and (-x+abs(t-5)-10)^2 or x^2
local y_component= round(y-sin(t))^2
local xy_comp = x_component + y_component 
-- remember, for a sphere: x^2 + y^2 +z^2 <= r^2

--local color_lookup={GREEN,WHITE,PEACH}

-- maths
if z>=-4 and xy_comp + (z-4)^2%12 <= 6 then
	return ({GREEN,WHITE,PEACH})[(z+11)//6]
elseif xy_comp==0 then
	return ORANGE
end
