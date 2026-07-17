-- This trick didnt work out
--function sphere_maybe(a,b,c)
--	return (x+a)^2 + (z+b)^2 + (c<1 and (y+c)^2 or 0)
--end
function construct_death_star(a, b) 
	-- that's no MOON!
	return (x+a)^2+(z+b)^2 
end

planet_ring=construct_death_star(0, 0)
moon_ring=construct_death_star(12, -12)
--function dowork()
    return planet_ring+y*y<=56 and GREEN -- planet
--  or y==x//2 and planet_ring>=99 and (planet_ring<=143 and DARKBROWN or planet_ring<=196 and BROWN)
    or y==x//2 and planet_ring//-98==-2 and (DARKBROWN-planet_ring//144)
    or moon_ring+(y-4)^2<=3 and PINK -- moon
    or y==4 and moon_ring//-8==-2 and BROWN
    or construct_death_star(-6, 0)+(y-7)^2<2 and GREY -- comet
    or x==y-1 and y>7 and construct_death_star(0, 12)//-28==-7 and ORANGE -- comet trail
--end

--function debug()
--	if x|y|z==0 then 
--		print(144//144)
--		print(143//144)
--		print(142//144)
--		print(140//144)
--		print(196//144)
--		print(196//-98)
--		print(142//-98)
--		print(99//-98)
--	end
--end

--return debug()
--return dowork()