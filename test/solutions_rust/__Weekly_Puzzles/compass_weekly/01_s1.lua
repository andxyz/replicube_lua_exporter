-- 66
-- 11.993

-- all compasses lead to Santa's house in the north pole.
circ = x^2 + y^2
return 
circ <= 20 and (
	z==-1 and DARKBLUE
	or
	z==0 and (
		(x==0 and y<=2 and y>=-2) and (y>=0 and RED or GREY)
		or circ <= 12 and WHITE or DARKBLUE
	)
	or
	z==1 and circ >= 12 and BLUE
)
