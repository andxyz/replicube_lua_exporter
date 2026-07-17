local X,Y,Z=x*x,y*y,z*z

-- the frame
if X>4 then return end
if X==4 then
	if y==1 and z<0 then return DARKBLUE end
	if z==-4 then
		if X==4 and y<=4 then return DARKBLUE end
	end
end

--screen
if X<=1 and z==-4 then
	if y==4 or y==1 then return DARKBLUE end
	if y==2 or y==3 then
		return 1-x+t//2 > 2 and LIGHTGREEN or RED
	end
end

-- tread
if y==-4 then
	if X<=1 and inrange(z,-3,3) then
		-- local x_offset
		-- local xx = X==1 and 1 or 0
		return (z-t+(X==1 and 1 or 0))%8<=1 and GREY or BLACK
	end
	return DARKBLUE 
end


-- print("t".. t .. " ".. t//2)
--t:0 (+0,+0,+0) t0 0
--t:1 (+0,+0,+0) t1 0
--t:2 (+0,+0,+0) t2 1
--t:3 (+0,+0,+0) t3 1
--t:4 (+0,+0,+0) t4 2
--t:5 (+0,+0,+0) t5 2
--t:6 (+0,+0,+0) t6 3
--t:7 (+0,+0,+0) t7 3
