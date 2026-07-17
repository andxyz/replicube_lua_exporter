if y~=-3 then
  if x==0 and z==0 then
    if y==1 then return YELLOW end
    return y<1
  end
  return
end

local xz=x*x+z*z
if xz<=7 then
  if xz==2 then return RED end
  return YELLOW
elseif xz<=10 then
  return ORANGE
end
