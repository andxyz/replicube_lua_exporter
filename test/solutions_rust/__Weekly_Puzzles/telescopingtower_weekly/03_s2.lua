v= 3*max(abs(x),abs(z))
return
y <= clamp(min(t-v-5, 13-t), -5, 4-v) and
({WHITE,GREY,DARKBLUE,BLACK})[v/3+1]

-- splunking for a better
-- ({1,2,12,3})[v/3+1] with an exponent would be smaller
-- like v^magic_expo