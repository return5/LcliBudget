local YearlyScreen <const> = require('screens.YearlyScreen')
local Expense <const> = require('screens.Expense')

local setmetatable <const> = setmetatable

local YearlyExpense <const> = {}
YearlyExpense.__index = YearlyExpense
setmetatable(YearlyExpense,YearlyScreen)

_ENV = YearlyExpense

function YearlyExpense:new()
	return setmetatable(YearlyScreen:new(Expense:new()),self)
end

return YearlyExpense
