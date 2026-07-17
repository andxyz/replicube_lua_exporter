--[[
You can use many different conditions to
compare numbers.  Here is a quick list:
'if a == b' means 'if a is equal to b'
'if a < b' means 'if a is less than b'
'if a <= b' means 'if a is less than or equal to b'
'if a > b' means 'if a is greater than b'
'if a >= b' means 'if a is greater than or equal to b'
'if a ~= b' means 'if a is not equal to b'

-- try changing the comparisons to solve this one! ]]
if y > 1 then 
	return RED 
elseif y >= -1 then 
	return YELLOW 
else
  return GREEN	
end