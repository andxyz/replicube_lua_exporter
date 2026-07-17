if x^2+y^2+z^2 > 7 then 
	return BLACK
elseif x^2+y^2+z^2 > 3 then
	return y == 2 or y == -2 and YELLOW 
 	    or z == 2 and ORANGE or z == -2 and RED
  	  or x == 2 and GREEN  or x == -2 and LIGHTBLUE
end -- 67
