local Node = require("Node")

---@param input string
function Tokenizer(input)
    local current = 0
    local tokens = {}
    while current <= #input do
        current = current + 1
        local char = input:sub(current, current)
        if char:match("%a") then
            local token = ""
            while current <= #input do
                local next_char = input:sub(current, current)
                if next_char:match("[%s%;]") then
                    break
                end
                token = token .. next_char
                current = current + 1
            end
            table.insert(tokens, Node.new("statement", token))
        end
        if char:match("%s") then
            current = current + 1
        end
        if char:match('%\"') then
            local token = ""
            current = current + 1
            while current <= #input do
                local next_char = input:sub(current, current)
                if next_char:match('[%;%"]') then
                    break
                end
                token = token .. next_char
                current = current + 1
            end
            table.insert(tokens, Node.new("string", token))
        end
        if char:match("[%=]") then
            table.insert(tokens, Node.new("operator", char))
            current = current + 1
        end
        if char:match("[%;]") then
            current = current + 1
        end
    end
    for index, value in ipairs(tokens) do
        print(value.type)
    end
end

return Tokenizer;
