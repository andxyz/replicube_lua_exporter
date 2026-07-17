--first_pass
--126
--86.639
function cube(offset)
	return 
	max(abs(x+offset), abs(y+offset)) == 10 and abs(z+offset) == 10
	or max(abs(x+offset), abs(z+offset)) == 10 and abs(y+offset) == 10
	or max(abs(y+offset), abs(z+offset)) == 10 and abs(x+offset) == 10
end

return (
	x%20==z%20 and y%20==z%20 and (y<-4 or y>4)
	or cube(6) 
	or cube(-6)
) and LIGHTGREEN + (x+y+z)%2