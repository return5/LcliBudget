local Screen <const> = require('screens.Screen')

local RangeExpense <const> = {}
RangeExpense.__Index = RangeExpense
setmetatable(RangeExpense,Screen)

_ENV = RangeExpense

function RangeExpense:new()
	return setmetatable(Screen:new(),self)
end

local rangeExpense <const> = RangeExpense:new()

function RangeExpense.getInstance()
	return rangeExpense
end


return RangeExpense
