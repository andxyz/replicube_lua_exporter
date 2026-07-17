-- f1
-- 193
-- 5.858

-- negative space trimming
if z>1 or y>1 then return end
if z<-1 or y<-1 then return end
if z==0 and y==0 then return end

--print(pi/8) -- 0.39269908169872 -- 0.39
local x_pi_8= x*0.39 -- x*pi/8

-- max(-1,min(1,(value_here)) is faster than clamp(value_here,-1,1)
if  y==max(-1,min(1,(2*cos(x_pi_8+7)+.5)//1))
and z==max(-1,min(1,(2*cos(x_pi_8-7)+.5)//1)) then return RED end
if  y==max(-1,min(1,(2*cos(x_pi_8-22)+.5)//1))
and z==max(-1,min(1,(2*cos(x_pi_8+14)+.5)//1)) then return LIGHTBLUE end 
if  y==max(-1,min(1,(2*cos(x_pi_8-20)+.5)//1))
and z==max(-1,min(1,(2*cos(x_pi_8+16)+.5)//1)) then return LIGHTGREEN end

-- We can keep adding 2*pi to our offset 
-- until we find a nice round number
-- that way we can avoid decimals
--print(pi/8) -- 0.39269908169872
--print(4*pi +pi*13/12) -- 15.9697626557481 -- 16
--print(2*pi +pi/4) -- 7.06858347057703 -- 7
--print(4*pi +pi/2) -- 14.1371669411541 -- 14
--print(6*pi +pi/3) -- 19.8967534727354 -- 20
--print(6*pi +pi) -- 21.9911485751286 -- 22