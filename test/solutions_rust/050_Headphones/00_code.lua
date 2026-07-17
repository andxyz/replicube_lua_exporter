-- TMBG have released 23 studio albums since their
-- debut in 1986.  Every album has multiple
-- incredible songs on it.

-- picking one at random, give this a listen:
-- 'Erase' from the 2015 album 'Glean'

-- empty space around
local Z=z*z
if Z>=9 then return end
local Y=y*y
if Y>36 then return end
local X=x*x
if X<25 and y<=4 then return end

-- headphones
local band = floor(sqrt(X + Y))
if y>0 and Z<=1 and band == 6 then 
	return PEACH -- band
elseif y<=0 and y>=-4 then
	if y<=-1 and y>=-3 and Z<=3 and X==49 then 
		return PINK -- outer pad color
	end
	if X>=36 and X<=49 then
		if Z<=16 then return PEACH end -- big pads 
	elseif X==25 then return BLACK end -- muffs
end