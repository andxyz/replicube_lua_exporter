-- much better hourglass!

-- Notes:
-- it can be helpful to visualize
-- values by returning them and looking at them
-- as colors.

-- adding and subtracting coordinates
-- can make lots of interesting slopes

ya = abs(y)-abs(z)-abs(x)+1 > 0
return ya and (y == 6 or y == -6) and DARKBROWN
	or ya and y > - 1 and YELLOW
 	or ya and LIGHTBLUE
