-- 87
-- 32.236

X=x*x
Y=y*y
Z=z*z
mengerish = X%3 + Y%3 + Z%3 > 1
return 
(X<=1 and Y<=1 or X<=1 and Z<=1 or Y<=1 and Z<=1) and
(mengerish and ({7,6, 11,10,9, 14,13})[y+4] or PEACH)
or
not mengerish and y+10

-- NOTE: if you squinted really hard,
-- notice the demo code had it all (heh heh)
-- So there is no _need_ to learn math if you are clever... 
-- or is being clever using math but not knowing?
--return
--demoHelper("subtraction_plus_reversal_subtraction", a, b, color1, color2) or
--demoHelper("outer_union", a, b, nil, PEACH)

--[[

-- 139
-- 96.052

-- An attempt at making it "small", working from the original concept

function sdMengerBox(px, py, pz, holeWidth)
  return holeWidth-min(max(px, py), max(py, pz), max(pz, px))
end

-- infinite repetition https://iquilezles.org/articles/sdfrepetition/
function iRepeat(px)
	return abs(((px + 1.5) % 3) - 1.5)
end

a = sdMengerBox(abs(x), abs(y), abs(z), 1.5)
b = sdMengerBox(iRepeat(x), iRepeat(y), iRepeat(z), .5)

return
max(-b,a)<=0 and y+10 or
max(-a,b)<=0 and ({7,6, 11,10,9, 14,13})[y+4] or
min(a,b)>0 and PEACH

]]--
