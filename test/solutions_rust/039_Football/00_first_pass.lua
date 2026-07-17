-- IF YOU TRAIN BY THROWING A
-- SQUARE FOOTBALL, WHEN YOU
-- SWITCH BACK TO A REGULATION
-- BALL, YOU CAN THROW FOR MILES!

-- inside ball
if z^2<8 and y^2<8 then
	-- white lines 
	if y==2 and z^2<2 and x^2<5 and x%2==0 then 
		return WHITE 
	end
	
	-- body
	return BROWN
end
