-- s1
-- 73
-- 109.713

function f(offset1, offset2)
	return y==v(offset1) and z==v(offset2)
end
function v(offset)
	return clamp((2*cos(x*pi/8+offset)+.5)//1,-1,1)
end

return
	  f(  7, -7) and RED
or  f( 22, 14) and LIGHTBLUE
or  f(-20, 16) and LIGHTGREEN

--print(pi/8) -- 0.39269908169872
--print(4*pi +pi*13/12) -- 15.9697626557481 -- 16
--print(2*pi +pi/4) -- 7.06858347057703 -- 7
--print(4*pi +pi/2) -- 14.1371669411541 -- 14
--print(6*pi +pi/3) -- 19.8967534727354 -- 20
--print(6*pi +pi) -- 21.9911485751286 -- 22
