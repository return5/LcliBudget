local Screen <const> = require('screens.Screen')

local MonthlyIncome <const> = {}
MonthlyIncome.__Index = MonthlyIncome
setmetatable(HelpScreen,Screen)

_ENV = MonthlyIncome

function MonthlyIncome:new()
	return setmetatable(Screen:new(),self)
end

local monthlyIncome <const> = MonthlyIncome:new()

function MonthlyIncome.getInstance()
	return monthlyIncome
end

return MonthlyIncome
