-- s1
-- 79
-- 6.757

if x+y+z~=0 or x<-5 or z<-5 or y<-5 then return end

-- factorial
function f(n)
  accum = 1
  for i= 2, n do
  	accum= accum*i
  end
	return accum
end

n= 15-(y+5)%15
k= x+5
return (f(n)/(f(k)*f(n-k)))%16
