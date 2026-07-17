-- 'Swirls' can be drawn
-- used a simpler equation
-- than 'Spirals'!
-- return max(abs(x),abs(y))&1
-- print("y//6: ".. y//6 .. " abs(z)//2: ".. abs(z)//2)

color= {LIGHTBLUE, LIGHTGREEN, ORANGE}
band_num= abs(z)//2+1
offset= y<0 and y//6*2 or 0 
swirl= max(abs(x+offset),abs(y))
jog= 2^(3-abs(z)//2)
return
swirl&1==1 and 
swirl<jog and 
color[band_num]
