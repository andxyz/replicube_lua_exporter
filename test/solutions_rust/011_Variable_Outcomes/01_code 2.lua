if z == 0 then
    return 3
end

if abs(x) == abs(y) then
--    return 10 - (sign(x-y)+1) * 4 - sign(z) * 0.5
    return 10 - (abs(sign(x-y))+1) * 4 - sign(z) * 0.5
end