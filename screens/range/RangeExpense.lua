local Expense <const> = require('screens.ammounts.Expense')
local setmetatable <const> = setmetatable

local RangeExpense <const> = {}
RangeExpense.__index = RangeExpense
setmetatable(RangeExpense,Expense)

_ENV = RangeExpense

function RangeExpense:new()
	return setmetatable(Expense:new(),self)
end

return RangeExpense
