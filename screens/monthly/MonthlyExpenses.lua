local Expense <const> = require('screens.amounts.Expense')
local MonthlyScreen <const> = require('screens.monthly.MonthlyScreen')

local setmetatable <const> = setmetatable

local MonthlyExpenses <const> = {}
MonthlyExpenses.__index = MonthlyExpenses

setmetatable(MonthlyExpenses,MonthlyScreen)

_ENV = MonthlyExpenses

function MonthlyExpenses:new()
	return setmetatable(MonthlyScreen:new(Expense:new()),self)
end

return MonthlyExpenses
