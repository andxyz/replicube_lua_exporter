-- by: theDerelict

q={x%3,y%3,z%3} sort(q)
return q[2]~=0 and 
       (x+y+z)^2<2 and 
       (x+1)//3+(y+1)//3+(z+1)//3==0 and 
       YELLOW-btoi(x^2+y^2+z^2<8)
