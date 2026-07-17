-- 41
-- 56.239
-- huh, I really thought my orange trick would help, oh well
-- it looks cooler
ORANGE=ORANGE
repeat
  a= 8 - ORANGE//2
  if (x+a|y+a|z+a)&ORANGE == 0 then
    return ORANGE
  end
  ORANGE=ORANGE//2
until ORANGE<2
