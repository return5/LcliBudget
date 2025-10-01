local setmetatable <const> = setmetatable
local write <const> = io.write

local Net <const> = { query = ""}
Net.__index = Net

_ENV = Net

function Net:print()
	write('income total: ',self.incomeTotal,"\n")
	write('expenses total: ',self.expenseTotal,"\n")
	write('net total: ',self.incomeTotal + self.expenseTotal,"\n")
end

function Net:new()
	return setmetatable({incomeTotal = 0,expenseTotal = 0},self)
end

function Net:addToTotal(value)
	if value > 0 then
		self.incomeTotal = self.incomeTotal + value
	else
		self.expenseTotal = self.expenseTotal + value
	end
end

return Net
