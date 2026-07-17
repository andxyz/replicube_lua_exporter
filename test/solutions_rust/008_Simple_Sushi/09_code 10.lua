-- sushi?
local X,Y = x^2,y^2
return X+Y==0 and RED
	or max(X,Y) == 1 and WHITE
	or GREEN
--12.160