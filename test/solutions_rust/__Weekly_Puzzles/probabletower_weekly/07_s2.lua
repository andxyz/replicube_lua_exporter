--s2
--72
--not working yet
i= 1
while i<=8 do
	local next_i= i*2
	if x<=8-i and x>8/i-next_i-8/i and z<=8-i and z>8/i-next_i-8/i then
		if y<=8-i and y>8-next_i then return i end 
	end
	i= next_i
end
