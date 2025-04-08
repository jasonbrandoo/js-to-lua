-- local input = io.open("index.js")
local Lexer = require('Lexer');
local Parser = require('Parser');

print("Please input js file :")
local fileName = io.read()
if not fileName:match("%.js$") then
    error("Not a javascript file")
end

local file, err = io.open(fileName, "r")
if not file then
    error("Error opening file : " .. err)
end

-- if input then
--     ---@type string
local source = Lexer:new(file:read("a"));
local parse = Parser:parse(source.token)


-- end
