-- f1
-- 70
-- 5.397

-- negative space
if x+y+z~=0 then return end
if x<-5 or z<-5 or y<-5 then return end
if x==-5 or z==-5 then return WHITE end
local n= 11-y
if x==-4 or z==-4 then return n-1 end
local cnk= 1
for k= 1,x+5 do
	cnk= cnk*(n-k)/k
end
return cnk

-- pascals_triangle
--local function pt(x,y,z)	
--	local k= x+5
--	local cnk= f(n)/(f(k)*f(n-k))
--	print(cnk)
--	return cnk%16
--end

-- factorial
--local function f(n)
--  local accum = 1
--  for i= 2, n do
--  	accum= accum * i
--  end
--	return accum
--end

--return pt(x,y,z)

-- special thanks to https://oeis.org/search
-- 6,10,15,5,12,4,13,7,2,14 -- k(k+1)/2 (mod 2^n) -- A329278 Irregular table read by rows. The n-th row is the permutation of {0, 1, 2, ..., 2^n-1} given by T(n,k) = k(k+1)/2 (mod 2^n).
-- 4,3,8,4,8,5,12,14,12,7 -- 20,35,56,84,120,165,220,286,364,455 -- A000292 Tetrahedral (or triangular pyramidal) numbers: a(n) = C(n+2,3) = n*(n+1)*(n+2)/6.
-- 6,14,2,10,15,11,9,5 -- 70,126,210,330,495,715,1001,1365 -- A000332 Binomial coefficient binomial(n,4) = n*(n-1)*(n-2)*(n-3)/24
-- 12,14,8,7,2,11 -- 252,462,792,1287,2002,3003 -- A000389 Binomial coefficients C(n,5). a(n) = n*(n-1)*(n-2)*(n-3)*(n-4)/120
-- 12,4,11,13 -- 924,1716,3003,5005 -- A000579 Figurate numbers or binomial coefficients C(n,6). a(n) = (n^6 - 15*n^5 + 85*n^4 - 225*n^3 + 274*n^2 - 120*n)/720.
-- 8,3

--[[
Each number is the sum of the two numbers above it.
Start with 1 in the top row and treat empty space as 0.

                   01
                 01  01
               01  02  01
             01  03  03  01
           01  04  06  04  01
         01  05  10  10  05  01
       01  06  15  20  15  06  01
     01  07  21  35  35  21  07  01
   ..  ..  ..  ..  ..  ..  ..  ..  ..

Bonus: try including %2 at the end to see a familiar fractal!
]]