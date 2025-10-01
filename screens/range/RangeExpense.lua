local Expense <const> = require('screens.amounts.Expense')
local RangeScreen <const> = require('screens.range.RangeScreen')

local setmetatable <const> = setmetatable

local RangeExpense <const> = {}
RangeExpense.__index = RangeExpense
setmetatable(RangeExpense,RangeScreen)

_ENV = RangeExpense

function RangeExpense:new()
	return setmetatable(RangeScreen:new(Expense:new()),self)
end

return RangeExpense
