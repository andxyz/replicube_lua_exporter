-- a function is helpful here!
function balloon(px, py, pz, color)
	x_local = x - px
	y_local = y - py
	z_local = z - pz

	if round(sqrt(x_local^2 + y_local^2 + z_local^2)) == 2 then
		return color
	end
end

-- you shouldn't need to change these numbers
return balloon( 0, 0,  2, 10)
    or balloon(-3, 5, -2,  5)
    or balloon( 4, 2, -3, 14)