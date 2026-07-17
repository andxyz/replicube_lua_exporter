-- GCD of two numbers using the Euclidean algorithm
local function gcd(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return abs(a)
end

return t==z+8 and gcd(gcd(x-y,z-y), t)
