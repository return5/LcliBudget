local Screen <const> = require('screens.Screen')

local YearlyIncome <const> = {}
YearlyIncome.__Index = YearlyIncome
setmetatable(YearlyIncome,Screen)

_ENV = YearlyIncome

function YearlyIncome:new()
	return setmetatable(Screen:new(),self)
end

local yearlyIncome <const> = YearlyIncome:new()

function YearlyIncome.getInstance()
	return yearlyIncome
end

return YearlyIncome
