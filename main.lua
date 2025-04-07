local input = io.open("index.js")
local Lexer = require('Lexer');
local Parser = require('Parser');


if input then
    ---@type string
    local str = input:read("a")
    local source = Lexer:new(str);
    local parse = Parser:parse(source.token)

end
