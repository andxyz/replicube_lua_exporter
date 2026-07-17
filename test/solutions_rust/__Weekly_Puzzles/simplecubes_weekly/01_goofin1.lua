X=abs(x)
Y=abs(y)
Z=abs(z)
function comp(a,b,c,n1,n2,n3,cl)
	return (a==b and a==n1 and c<=n1
	 or a==b and a==n2 and c<=n2
	 or a==b and a==n3 and c<=n3)
	 and cl
end
return
comp(X,Y,Z,5,3,1,Y//2+7) or 
comp(Y,Z,X,5,3,1,Y//2+7) or 
comp(Z,X,Y,5,3,1,Z//2+7)
