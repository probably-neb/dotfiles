function capitalize(self)
   local R = self:sub(1,1):upper()..self:sub(2):lower()
   return R
end
