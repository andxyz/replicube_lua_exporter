c = abs(x)+abs(z)
x = (x+1)%3 - 1
z = ((z+1)%3 - 1)*3
return x|z == 0 and c+4 or y == 0 and x+z+5