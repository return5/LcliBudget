local Screen <const> = require('screens.Screen')

local RangeIncome <const> = {}
RangeIncome.__Index = RangeIncome
setmetatable(RangeIncome,Screen)

_ENV = RangeIncome

function RangeIncome:new()
	return setmetatable(Screen:new(),self)
end

local rangeIncome <const> = RangeIncome:new()

function RangeIncome.getInstance()
	return rangeIncome
end

return RangeIncome
