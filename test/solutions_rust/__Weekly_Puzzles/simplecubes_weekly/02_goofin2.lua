X=abs(x)
Y=abs(y)
Z=abs(z)
function compare(a,b,c,color)
	return (
	 a==b and a==5 and c<=5 or 
	 a==b and a==3 and c<=3 or 
	 a==b and a==1 and c<=1
	 ) and color
end
return
compare(X,Y,Z,Y//2+7) or 
compare(Y,Z,X,Y//2+7) or 
compare(Z,X,Y,Z//2+7)
