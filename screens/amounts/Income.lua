local setmetatable <const> = setmetatable
local write <const> = io.write

local Income <const> = {query = "and amount > 0"}
Income.__index = Income

_ENV = Income

function Income:print()
	write('total income: ',self.total,"\n")
end

function Income:new()
	return setmetatable({total = 0},self)
end

function Income:addToTotal(value)
	self.total = self.total + value
end

return Income
