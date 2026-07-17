-- this looks like a nice place for a fountain!
if y==-extent then
	return GREEN
elseif y==-extent+1 and (x+z)%4==0 and (x-z)%4==0 then
	return LIGHTGREEN
end