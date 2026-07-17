c = EMPTY

-- bottom and monitor
if y == -extent then c = PINK end
if z < -extent + 3 then c = PINK end

-- screen
if z == -extent + 2 then
	if x^2 == 9 and inrange(y,0,2) or x == -1 and y == 2 then c = WHITE
	elseif 
	 x^2<16 and
   y>-2 and 
	 y~=extent then c = DARKBLUE end
end

-- keyboard
if y == -extent + 1 and 
   x^2 < 16 and 
	 (z+2)^2 > 3 and 
	 z^2 < 16 
	 then c = LIGHTBLUE end

return c