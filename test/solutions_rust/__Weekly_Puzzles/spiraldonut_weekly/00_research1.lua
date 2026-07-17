-- If it existed in reality,
-- it would be crispy as a croissant!

function spiralNr(xx, yy)
  local X = xx^2
  local Y = yy^2
  local m = max(X, Y)
   
	local se = (yy < xx) and 1 or 0
  local sw = (yy <= -xx) and 1 or 0
    
  local common = -2 * se + 4 * se * sw
	
  return 4 * m + (common - 1) * xx - (common + 1) * yy
end

return spiralNr(y,z)

--if x|z>0 or y^2>=16 then return end
--
--local A=0
--local B=1
--
--if x<0 then
--	if sqrt(y^2+z^2) == A + B * atan(z,y) then
--		return YELLOW 
--	end
--end
--
--if x % 2 == 0 and y >= x and z >= x then return 7 
--elseif z % 2 == 0 and 
--elseif y % 2 == 1 and x > y and z >= y then return 9 end