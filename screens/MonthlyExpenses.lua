local Screen <const> = require('screens.Screen')

local MonthlyExpenses <const> = {}
MonthlyExpenses.__index = MonthlyExpenses

setmetatable(MonthlyExpenses,Screen)

_ENV = MonthlyExpenses

function MonthlyExpenses:new()
	return setmetatable(Screen:new(),self)
end

local monthlyExpenses <const> = MonthlyExpenses:new()

function MonthlyExpenses.getInstance()
	return monthlyExpenses
end

return MonthlyExpenses
