-- This was sort of a fire-escape idea at first,
-- but then I decided to add some symmetry which
-- I thought was kinda nice.

if z < 0 then
 if -x == y then return GREY end
elseif z == 0 then
	return RED
elseif z > 0 then
	if x == y then return GREY end
end
-- code: 25
-- cycle: 5.537
