---@class Parser
---@field tokens Node
local Parser = {}

---@param tokens Node[]
function Parser.parse(self, tokens)
    self.tokens = tokens
    return self
end

return Parser
