-- 198
-- 130.784

-- My version of making the sdf code "small"

-- btw, 17.790 is my fastest, see bottom
-- btw, 93 is my smallest, see bottom

-- NOTE: if you squinted really hard,
-- notice the demo code had it all (heh heh)
--return
--demoHelper("subtraction_plus_reversal_subtraction", a, b, color1, color2) or
--demoHelper("outer_union", a, b, nil, PEACH)

function sdMengerBox(px, py, pz, holeWidth)
  apx = abs(px)
  apy = abs(py)
  apz = abs(pz)
  return max(
					-min(
						max(apx - holeWidth, apy - holeWidth), 
						max(apy - holeWidth, apz - holeWidth), 
						max(apz - holeWidth, apx - holeWidth)
					)
				)
end

a = sdMengerBox(x, y, z, 1.5)
b = sdMengerBox(
	((x + 1.5) % 3) - 1.5,
	((y + 1.5) % 3) - 1.5,
	((z + 1.5) % 3) - 1.5, .5
)

return
max(-b,a)<=0 and y+10 or
max(-a,b)<=0 and ({7,6, 11,10,9, 14,13})[y+4] or
min(a,b)>0 and PEACH

-- btw, 17.790 is my fastest
-- btw, 93 is my smallest

--[[
-- 104
-- 17.790
local X,Y,Z=x*x,y*y,z*z
--local inner_test = X<=1 and Y<=1 or X<=1 and Z<=1 or Y<=1 and Z<=1
--local mengerish = X%3 +Y%3 + Z%3 > 1
if X<=1 and Y<=1 or X<=1 and Z<=1 or Y<=1 and Z<=1 then
  if X%3 +Y%3 + Z%3 > 1 then
		return ({7,6, 11,10,9, 14,13})[y+4]
	else return PEACH end
else
	if X%3 +Y%3 + Z%3 <= 1 then
		return y+10
	end
end

-- 93
-- 31.236
X=x*x
Y=y*y
Z=z*z
--inner_test = X<=1 and Y<=1 or X<=1 and Z<=1 or Y<=1 and Z<=1
mengerish = X%3 +Y%3 + Z%3 > 1
if X<=1 and Y<=1 or X<=1 and Z<=1 or Y<=1 and Z<=1 then
  if mengerish then
		return ({7,6, 11,10,9, 14,13})[y+4]
	else return PEACH end
else
	if not mengerish then
		return y+10
	end
end

]]--