--s2
--84
--14.798
stick_test= y%4==y%8
function test(v, stick_test)
	return v*v==4 and BLUE+btoi(v<0 and stick_test or v>0 and not stick_test)
end
return x*x+z*z<=9 and
(
	y%4==0 and test(x, stick_test) -- bars
	or
	x*sign(z)%4==(y-2)%4 and test(z, not stick_test) -- connectors
)
