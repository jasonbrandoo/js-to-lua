---@param input string
function Tokenizer(input)
    local current = 1
    local tokens = {}
    while current <= #input do
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
            tokens[#tokens + 1] = token
        end
        if char:match("%s") then
            current = current + 1
        end
        if char:match('%\"') then
            local quote = char
            local token = char
            current = current + 1
            while current <= #input do
                local next_char = input:sub(current, current)
                if next_char:match(";") then
                    break
                end
                token = token .. next_char
                current = current + 1
            end
            tokens[#tokens + 1] = token
        end
        if char:match("[%=]") then
            tokens[#tokens + 1] = char
            current = current + 1
        end
        if char:match("[%;]") then
            current = current + 1
        end
    end
    for index, value in ipairs(tokens) do
        print(index .. value)
    end
end

return Tokenizer;
