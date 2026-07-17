-- 149
-- 7.540
-- They Might Be Giants main 2 members
-- are John Linnel and John Flansburgh.

-- Linnel plays the piano / keyboard
-- and tends to write songs with lots
-- of wordplay and unusual subject
-- matter.

-- Great example:
--'Kiss Me, Son Of God' from the album 'Lincoln'


-- empty space
if y>4 then return end
if z*z>4 or z==2 then return end
local dy=y+2
local is_Xcross = x==dy or x==-dy
if not is_Xcross and y<3 then return end

-- keyboard
local X=x*x
if y==4 or y==3 then
	if y==4 and z~=-2 and X < extent*extent then
		if z<1 then
			return x>0 and x%2==1 and BLACK or x<0 and x%2==0 and BLACK or WHITE
		end
		return WHITE
	end
	return PURPLE
end

-- the stand
if y<3 then
	local is_long_bars = dy^2 + X == 32 and is_Xcross
	local is_Xcross_skinny = is_Xcross and z==-1
	return (is_long_bars or is_Xcross_skinny) and BLACK
end
