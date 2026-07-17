-- what about a metroidvania / adventure game,
-- but you play as a dolphin underwater?
-- that would be amazing!

-- you could meet all sorts of friends and
-- foes like this cool octopus here.

if y>-2 then
	local X = x^2
	local Z = z^2
	-- cone
	if y<1 or y==5 then 
		if X+Z < 1/11*(y-6)^2 then return RED end
	end
	-- head
	if y>0 then
		if y==2 and z == 2 and X==1 then return BLACK
		elseif X + Z + (y-2)^2 < 8 then return RED end
	end
elseif y == -2 then
	local X = x*x
	local Z = z*z
  if X == Z and X + Z <= 32 then 
		return RED
	elseif z==0 or x==0 then
		return RED 
	end
elseif y<-2 then return DARKBLUE -- water
end