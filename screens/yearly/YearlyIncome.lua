local YearlyScreen <const> = require('screens.yearly.YearlyScreen')
local Income <const> = require('screens.amounts.Income')

local setmetatable <const> = setmetatable

local YearlyIncome <const> = {}
YearlyIncome.__index = YearlyIncome
setmetatable(YearlyIncome,YearlyScreen)

_ENV = YearlyIncome

function YearlyIncome:new()
	return setmetatable(YearlyScreen:new(Income:new()),self)
end

return YearlyIncome
