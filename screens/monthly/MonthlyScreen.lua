
local Screen <const> = require('screens.Screen')

local setmetatable <const> = setmetatable

local MonthlyScreen <const> = {}
MonthlyScreen.__index = MonthlyScreen
setmetatable(MonthlyScreen,Screen)

_ENV = MonthlyScreen

function MonthlyScreen:new(amountObj)
	return setmetatable(Screen:new(amountObj),self)
end

function MonthlyScreen:setRange()
	return self:setStopRange(self:getTodayDate()):setStartRange(self:getStartMonthDate())
end

return MonthlyScreen
