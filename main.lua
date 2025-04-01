local input = io.open("index.js")
local Tokenizer = require('Tokenizer');

if input then
    ---@type string
    local str = input:read("a")
    Tokenizer(str)
end
