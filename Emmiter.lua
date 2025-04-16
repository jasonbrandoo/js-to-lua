local Emmiter = {}
Emmiter.code = ""

function Emmiter.write(self, code)
    self.code = self.code .. code
end

return Emmiter