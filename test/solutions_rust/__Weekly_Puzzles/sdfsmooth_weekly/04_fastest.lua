-- size: 71
-- c/v:  9.115

-- ##empty_space
local YZ= y^2 + z^2
if YZ>89 then return end

-- ##maths
local X = x^2
local T = (t-16)^2
if T + X + YZ < 50 + 2*(X*T + 4e2)^.5 then
	if x>0 then
		return x+1
	else
		return 1-x
	end
end

-- I personally struggled to make the eq'n more simplified, ended up using free matlab online
-- they give 20hours/month free for hobbists
-- matlab.mathworks.com
-- https://www.mathworks.com/help/symbolic/sym.simplify.html
-- first I declare all my "symbolics"
-- then we define some values and our eqn, then we ask it to simplify
-- syms a b c x y z t
-- a = (x + 16 - t)^2 + y^2 + z^2 - 50
-- b = (x - 16 + t)^2 + y^2 + z^2 - 50
-- eqn = (a + b - sqrt((b - a)^2+6400))/2 < 0
-- simplify(eqn,"All",true)
--
-- hooray! the matlabs simplify() func completed and then gave me this answer as a choice, 1 of 4 simlifications
-- x^2 + t^2 - 2*(t^2*x^2 - 32*t*x^2 + 256*x^2 + 400)^(1/2) - 32*t + y^2 + z^2 + 256 < 50
--
-- We can simplify further!:
-- eqn2 = t^2*x^2 - 32*t*x^2 + 256*x^2 + 400
-- collect(eqn2,"All",true)
-- (t^2 - 32*t + 256)*x^2 + 400
-- eqn3 = t^2 - 32*t + 256
-- simplify(eqn3)
-- (t - 16)^2
-- Below we now try to put it all together:
--
-- x^2 + t^2 - 2*(t^2*x^2 - 32*t*x^2 + 256*x^2 + 400)^(1/2) - 32*t + y^2 + z^2 + 256 < 50
-- x^2 + t^2 - 32*t + 256 + y^2 + z^2  < 50 + 2*(t^2*x^2 - 32*t*x^2 + 256*x^2 + 400)^(1/2)
-- x^2 + t^2 - 32*t + 256 + y^2 + z^2  < 50 + 2*((t^2 - 32*t + 256)*x^2 + 400)^(1/2)
-- x^2 + (t-16)^2 + y^2 + z^2  < 50 + 2*(x^2*(t-16)^2 + 400)^.5
-- substitute for T,X,Y,Z
-- T + X + YZ < 50 + 2*(X*T + 400)^.5

