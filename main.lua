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

local lexer = Lexer:new(file:read("a"));
local parser = Parser:new(lexer)

print("Ok")
