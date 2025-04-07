---@class Node
---@field type string
---@field value string
---@field new fun(self: Node, type: string, value: string): table
local Node = {}
Node.type = ""
Node.value = ""

function Node.new(self, type, value)
    self.type = type
    self.value = value
    return {
        type = self.type,
        value = self.value
    }
end

return Node
