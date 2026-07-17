-- This was sort of a fire-escape idea at first,
-- but then I decided to add some symmetry which
-- I thought was kinda nice.

if z == 0 then
	return RED
elseif x == y and z > 0 or -x == y and z < 0 then
	return GREY
end
-- code:  28
-- cycle: 5.980