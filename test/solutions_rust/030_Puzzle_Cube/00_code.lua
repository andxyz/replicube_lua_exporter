if max(x^2+y^2, x^2+z^2, y^2+z^2) == 8 then 
	return BLACK 
elseif max(x^2, y^2, z^2) == 4 then
	return y == 2 and WHITE  or y == -2 and YELLOW 
 	    or z == 2 and ORANGE or z == -2 and RED
  	  or x == 2 and GREEN  or x == -2 and LIGHTBLUE
end -- original solve
