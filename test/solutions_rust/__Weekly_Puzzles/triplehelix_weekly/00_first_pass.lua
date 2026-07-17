-- first_pass
-- 152
-- 68.762

local xpi8= x*pi/8
return
    y==clamp((3*cos(xpi8+pi/4)+.5)//1,-1,1)
and z==clamp((3*cos(xpi8-pi/4)+.5)//1,-1,1) and RED
or  y==clamp((3*cos(xpi8-pi)+.5)//1,-1,1)
and z==clamp((3*cos(xpi8+pi/2)+.5)//1,-1,1) and LIGHTBLUE 
or  y==clamp((3*cos(xpi8-pi/3)+.5)//1,-1,1)
and z==clamp((3*cos(xpi8+pi*13/12)+.5)//1,-1,1) and LIGHTGREEN
