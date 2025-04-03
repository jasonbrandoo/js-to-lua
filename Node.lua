---@class Node
---@field value string
local Node = {}

function Node.new(value)
    return {
        value = value
    }
end

return Node
