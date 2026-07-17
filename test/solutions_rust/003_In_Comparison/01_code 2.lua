--return y > 1 and RED or y >= -1 and YELLOW or GREEN

--return y > 1 and 7 or y > -2 and 9 or 11 -- 14

-- 7 9 11

-- 7    00111
-- 8    01000
-- 9    01001
-- 10   01010
-- 11   01011

return ((6+y)&-4)+7