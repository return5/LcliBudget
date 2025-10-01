local Income <const> = require('screens.Income')
local MonthlyScreen <const> = require('screens.MonthlyScreen')

local setmetatable <const> = setmetatable

local MonthlyIncome <const> = {}
MonthlyIncome.__index = MonthlyIncome
setmetatable(MonthlyIncome,MonthlyScreen)

_ENV = MonthlyIncome

function MonthlyIncome:new()
	return setmetatable(MonthlyScreen:new(Income:new()),self)
end

return MonthlyIncome
