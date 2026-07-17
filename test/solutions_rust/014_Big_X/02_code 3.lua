--return x^2 == y^2 and y^2 == z^2 and BLACK

--test = -3
--if inrange(x,-3,3) and y == 1 and z == 1 and inrange(y,-3,3) and inrange(z,-3,3) then
--	print(" & " .. (x&test) .. ", | " .. (x|test) .. ", ~ " .. (x~test))
--end
--

-- return max(x, max(y, z)) == min(x, min(y, z)) and 3

return abs(x) == abs(y) and abs(y) == abs(z) and 3

