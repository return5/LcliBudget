local Expense <const> = require('screens.Expense')
local MonthlyScreen <const> = require('screens.MonthlyScreen')

local setmetatable <const> = setmetatable

local MonthlyExpenses <const> = {}
MonthlyExpenses.__index = MonthlyExpenses

setmetatable(MonthlyExpenses,MonthlyScreen)

_ENV = MonthlyExpenses

function MonthlyExpenses:new()
	return setmetatable(MonthlyScreen:new(Expense:new()),self)
end

return MonthlyExpenses
