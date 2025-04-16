local Grammar = require("Grammar")
local Emmiter = require("Emmiter")

---@class AST
---@field type string
---@field body { type: string, value: string }[]
local AST = {}
AST.type = "Program"
AST.body = {}

---@class Parser
---@field lexer Lexer
---@field currentToken Node
---@field peekToken Node
---@field currentIndex number
---@field JSAST AST
local Parser = {}
Parser.currentIndex = 0

---@param lexer Lexer
function Parser.new(self, lexer)
    self.lexer = lexer
    self.JSAST = self:parse()
    return self
end

---@param self Parser
---@return AST
function Parser.parse(self)
    local walk = function()
        local token = {}
        self:nextToken()
        if self.currentToken.value == "let" and self.currentToken.type == Grammar.Identifier then
            token = {
                type = "VariableDeclaration",
                value = self.currentToken.value,
                declarations = {}
            }
            self:nextToken()
            if self.currentToken.type == Grammar.Identifier then
                local variableDeclarator = {
                    type = "VariableDeclarator",
                    id = self.currentToken.value,
                    init = {}
                }
                table.insert(token.declarations, variableDeclarator)
                self:nextToken()
                if self.currentToken.type == Grammar.Punctuator then
                    self:nextToken()
                    if self.currentToken.type == Grammar.StringLiteral then
                        local stringLiteral = {
                            type = Grammar.StringLiteral,
                            value = self.currentToken.value
                        }
                        variableDeclarator.init = stringLiteral
                    end
                end
            end
        end
        return token
    end
    while self.currentIndex < #self.lexer.token do
        table.insert(AST.body, walk())
    end
    return AST
end

---@param self Parser
function Parser.nextToken(self)
    self.currentIndex = self.currentIndex + 1
    self.currentToken = self.lexer.token[self.currentIndex]
end

---@return AST
function Parser.transformer(self)
    local newAST = {
        type = "Block",
        body = {}
    }
    local body = self.JSAST.body;

    local traverse = function (ast)
        if ast == nil then
            return nil
        end

        if type() then
            
        end
    end

    while 0 < #body do
        
    end

    return newAST
end

return Parser
