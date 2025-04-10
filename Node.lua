---@class Node
---@field type Grammar
---@field value string
---@field new fun(self: Node, type: Grammar, value: string): table
local Node = {}

function Node.new(self, type, value)
    self.type = type
    self.value = value
    return {
        type = self.type,
        value = self.value
    }
end

return Node
