local Node = require("Node")
local Grammar = require("Grammar")

---@class Lexer
---@field source string
---@field currentChar string
---@field token table
---@field currentIndex number
local Lexer = {}
Lexer.source = ""
Lexer.currentChar = ""
Lexer.token = {}
Lexer.currentIndex = 0

function Lexer.new(self, source)
    self.source = source
    while self:peek() ~= "\0" do
        self:getToken()
    end
    return self
end

function Lexer.nextChar(self)
    if self.currentIndex >= #self.source then
        print("End of file")
        self.currentChar = "\0"
    else
        self.currentIndex = self.currentIndex + 1
        self.currentChar = self.source:sub(self.currentIndex, self.currentIndex)
    end
end

function Lexer.peek(self)
    if self.currentIndex >= #self.source then
        return "\0"
    else
        return self.source:sub(self.currentIndex + 1, self.currentIndex + 1)
    end
end

function Lexer.getToken(self)
    if self.currentChar:match("%a") then
        local char = "";
        local startIndex = self.currentIndex
        while self:peek():match("%w") do
            self:nextChar()
        end
        char = self.source:sub(startIndex, self.currentIndex)
        table.insert(self.token, Node:new(Grammar.Identifier, char))
    end
    if self.currentChar:match("%d") then
        local char = "";
        local startIndex = self.currentIndex
        while self:peek():match("%d") do
            self:nextChar()
        end
        char = self.source:sub(startIndex, self.currentIndex)
        table.insert(self.token, Node:new(Grammar.NumberLiteral, char))
    end
    if self.currentChar:match("%\"") then
        self:nextChar()
        local char = "";
        local startIndex = self.currentIndex
        while self.currentChar ~= "\"" do
            if self.currentChar == "\n" or self.currentChar == "\t" then
                break
            end
            self:nextChar()
        end
        char = self.source:sub(startIndex, self.currentIndex - 1)
        table.insert(self.token, Node:new(Grammar.StringLiteral, char))
    end
    if self.currentChar:match("[%=%+%-%*]") then
        table.insert(self.token, Node:new(Grammar.Punctuator, self.currentChar))
    end
    self:nextChar()
end

return Lexer
