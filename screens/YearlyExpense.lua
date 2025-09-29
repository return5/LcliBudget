local Screen <const> = require('screens.Screen')

local YearlyExpense <const> = {}
YearlyExpense.__Index = YearlyExpense
setmetatable(YearlyExpense,Screen)

_ENV = YearlyExpense

function YearlyExpense:new()
	return setmetatable(Screen:new(),self)
end

local yearlyExpense <const> = YearlyExpense:new()

function YearlyExpense.getInstance()
	return yearlyExpense
end

return YearlyExpense
