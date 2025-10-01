local Income <const> = require('screens.amounts.Income')
local RangeScreen <const> = require('screens.range.RangeScreen')

local setmetatable <const> = setmetatable

local RangeIncome <const> = {}
RangeIncome.__index = RangeIncome
setmetatable(RangeIncome, RangeScreen)

_ENV = RangeIncome

function RangeIncome:new()
	return setmetatable(RangeScreen:new(Income:new()),self)
end

return RangeIncome
