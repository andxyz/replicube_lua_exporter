-- An analog horror game where
-- watching a cursed TV signal dooms
-- you to die unless you make someone
-- else watch it!
if y>=-1 and x*x<=16 then
	return (z+4) - 2*(y-3) - abs(x)//abs(z+6) > 3 and DARKBLUE
--	return (z+4)-2*(y-3) >= abs(x) and DARKBLUE
end