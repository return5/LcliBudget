local setmetatable <const> = setmetatable
local write <const> = io.write

local Expense <const> = {query = "and amount < 0"}
Expense.__index = Expense

_ENV = Expense

function Expense:print()
	write("expenses total: ",self.total,"\n")
end

function Expense:new()
	return setmetatable({total = 0},self)
end

function Expense:addToTotal(value)
	self.total = self.total + value
end

return Expense
