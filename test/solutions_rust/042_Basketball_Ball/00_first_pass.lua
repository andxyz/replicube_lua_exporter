-- FOR THIS TO WORK YOU REALLY
-- NEED A SQUARE HOOP AS WELL

if x==0 or y==0 then return BLACK
elseif z^2==9 and y%2==0 then return BLACK
elseif y^2 + x^2 > 17 then return BLACK
end
return BROWN