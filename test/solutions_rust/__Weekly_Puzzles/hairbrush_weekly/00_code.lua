-- shifting over a part
shifted_x = x-4

if abs(shifted_x)<2 and abs(y)<2 and abs(z)<2 then
	return RED
end

-- not shifted part
if abs(x)<2 and abs(y)<2 and abs(z)<2 then
	return YELLOW
end