local Node = require("Node")

---@param input string
function Tokenizer(input)
    local current = 1
    local tokens = {}
    while current <= #input do
        local char = input:sub(current, current)

        --- CHARACTER
        if char:match("%a") then
            local token = ""
            while current <= #input do
                local next_char = input:sub(current, current)
                if next_char:match("[%s]") then
                    break
                end
                token = token .. next_char
                current = current + 1
            end
            table.insert(tokens, Node.new(token))
        end
        --- SPACE
        if char:match("%s") then
            current = current + 1
        end
        --- DOUBLE QUOTE
        if char:match('%\"') then
            local token = ""
            current = current + 1
            while current <= #input do
                local next_char = input:sub(current, current)
                current = current + 1
                print(next_char .. " Is the next char")
                if next_char:match('[%"]') then
                    break
                end
                token = token .. next_char
            end
            table.insert(tokens, Node.new(token))
        end
        --- OPERATOR
        if char:match("[%=%+]") then
            table.insert(tokens, Node.new(char))
            current = current + 1
        end
        --- SEMICOLON
        if char:match("[%;]") then
            current = current + 1
        end
    end
    print("\n")
    print("===TOKEN===")
    print("\n")
    for i, v in ipairs(tokens) do
        for key, value in pairs(v) do
            print(key .. " => " .. value)
        end
    end
end

return Tokenizer;
