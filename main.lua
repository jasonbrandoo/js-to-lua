local input = io.open("index.js")
local Lexer = require('Lexer');


if input then
    ---@type string
    local str = input:read("a")
    local source = Lexer:new(str);

    while source:peek() ~= "\0" do
        source:getToken()
    end
end
