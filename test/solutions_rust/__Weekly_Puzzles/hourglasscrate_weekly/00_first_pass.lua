-- first_pass
-- 76
-- 24.878

X= abs(x)
Y= abs(y)
Z= abs(z)
return 
max(X,Y,Z)==4 and (
	(X==Y or Y==Z or X==Z) and WHITE 
	or
	(
		Y==4 and X>Z and LIGHTBLUE 
		or Y>X and RED
		or X<Z and LIGHTGREEN 
		or Y>Z and LIGHTBLUE
		or Y<X and LIGHTGREEN
	)
)
