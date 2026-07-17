-- 41
-- 56.239
m= 8

repeat
  off= 8 - m//2
	
  if (x+off | y+off | z+off)&m == 0 then
    return m
  end
	
  m=m//2

until m<2
