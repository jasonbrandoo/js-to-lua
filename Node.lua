---@class Node
---@field type string
---@field value string
local Node = {}

function Node.new(type, value)
    return {
        type = type,
        value = value
    }
end

return Node
