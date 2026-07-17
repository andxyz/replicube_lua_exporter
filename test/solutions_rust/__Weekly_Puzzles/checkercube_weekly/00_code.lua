-- Checker Cube
--
-- Fill Inside 11x11x11, Dividers, and Edges all BLACK
if (x > -6 and x < 6) and (y > -6 and y < 6) and (z > -6 and z < 6) then return BLACK end
if (x == 2 or x == -2) or (y == 2 or y == -2) or (z == 2 or z ==-2) then return BLACK end
if btoi(x == 6 or x == -6)+btoi(y == 6 or y == -6)+btoi(z == 6 or z == -6) >= 2 then return BLACK end

-- Starting Position
if x == 6 then return RED end
if x == -6 then return ORANGE end
if y == 6 then return WHITE end
if y == -6 then return YELLOW end
if z == 6 then return GREEN end
if z == -6 then return BLUE end