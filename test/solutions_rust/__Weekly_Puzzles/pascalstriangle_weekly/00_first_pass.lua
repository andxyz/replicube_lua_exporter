-- first_pass
-- 295
-- 5.228

-- negative space
if x+y+z~=0 then return end
if x<-5 or z<-5 or y<-5 then return end

-- pascals_triangle
if x==-5 or z==-5 then return WHITE end

if x==-4 or z==-4 then
	local n= 10-y
	return n
end
if x==-3 or z==-3 then
	local n= 10-y
	return n*(n-1)/2
  -- if y==6 then return 6 end -- slower
  -- if y==5 then return 10 end
  -- if y==4 then return 15 end
  -- if y==3 then return 5 end
  -- if y==2 then return 12 end
  -- if y==1 then return 4 end
  -- if y==0 then return 13 end
  -- if y==-1 then return 7 end
  -- if y==-2 then return 2 end
  -- if y==-3 then return 14 end
  -- if y==-4 then return 11 end
  -- if y==-5 then return 9 end
end
if x==-2 or z==-2 then
	-- return ({4,3,8,4,8,5,12,14,12,7})[n-5] -- slower
	local n= 10-y
  return n*(n-1)*(n-2)/6
	-- if y==4 then return 4 end -- slower
	-- if y==3 then return 3 end
	-- if y==2 then return 8 end
	-- if y==1 then return 4 end
	-- if y==0 then return 8 end
	-- if y==-1 then return 5 end
	-- if y==-2 then return 12 end
	-- if y==-3 then return 14 end
	-- if y==-4 then return 12 end
	-- if y==-5 then return 7 end
end
if x==-1 or z==-1 then
	-- return ({6,14,2,10,15,11,9,5})[n-7] -- slower
	-- return n*(n-1)*(n-2)*(n-3)/24 -- slower
	if y==2 then return 6 end
	if y==1 then return 14 end
	if y==0 then return 2 end
	if y==-1 then return 10 end
	if y==-2 then return 15 end
	if y==-3 then return 11 end
	if y==-4 then return 9 end
	if y==-5 then return 5 end
end
if x==0 or z==0 then
	-- return ({12,14,8,7,2,11})[n-9] -- same speed, so strange
	-- return n*(n-1)*(n-2)*(n-3)*(n-4)/120 -- slower
	if y==0 then return 12 end
	if y==-1 then return 14 end
	if y==-2 then return 8 end
	if y==-3 then return 7 end
	if y==-4 then return 2 end
	if y==-5 then return 11 end
end
if x==1 or z==1 then
	-- return ({12,4,11,13})[-1-y]
	-- return n*(n-1)*(n-2)*(n-3)*(n-4)*(n-5)/720 -- slower
	if y==-2 then return 12 end
	if y==-3 then return 4 end
	if y==-4 then return 11 end
	if y==-5 then return 13 end
end
 -- return ({8,3})[n-13] -- slower
if y==-4 then return ORANGE end
return BLACK

-- Special thanks to The On-Line Encyclopedia of Integer Sequences (OEIS)
-- see https://oeis.org/search
--
-- I calculated the value for pascals triangle and printed it
-- I then entered the values in order when walking down the sides of the triangle
-- into oeis.
-- Overtime I realized the the pattern, 
-- they are all related to calculating the "Binomial coefficients"
--
-- 6,10,15,5,12,4,13,7,2,14 -- k(k+1)/2 (mod 2^n) -- A329278 Irregular table read by rows. The n-th row is the permutation of {0, 1, 2, ..., 2^n-1} given by T(n,k) = k(k+1)/2 (mod 2^n).
-- 4,3,8,4,8,5,12,14,12,7 -- 20,35,56,84,120,165,220,286,364,455 -- A000292 Tetrahedral (or triangular pyramidal) numbers: a(n) = C(n+2,3) = n*(n+1)*(n+2)/6.
-- 6,14,2,10,15,11,9,5 -- 70,126,210,330,495,715,1001,1365 -- A000332 Binomial coefficient binomial(n,4) = n*(n-1)*(n-2)*(n-3)/24
-- 12,14,8,7,2,11 -- 252,462,792,1287,2002,3003 -- A000389 Binomial coefficients C(n,5). a(n) = n*(n-1)*(n-2)*(n-3)*(n-4)/120
-- 12,4,11,13 -- 924,1716,3003,5005 -- A000579 Figurate numbers or binomial coefficients C(n,6). a(n) = (n^6 - 15*n^5 + 85*n^4 - 225*n^3 + 274*n^2 - 120*n)/720.
-- 8,3

-- function pascals_triangle
--local function pt(x,y,z)
--	local k= x+5
--	local cnk= f(n)/(f(k)*f(n-k))
--	print(cnk)
--	return cnk%16
--end

-- factorial
--local function f(n)
--  local accum= 1
--  for i= 2, n do
--  	accum= accum * i
--  end
--	return accum
--end

--return pt(x,y,z)

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
