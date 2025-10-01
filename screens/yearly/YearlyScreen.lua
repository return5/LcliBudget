
local Screen <const> = require('screens.Screen')

local setmetatable <const> = setmetatable

local YearlyScreen <const> = {}
YearlyScreen.__index = YearlyScreen
setmetatable(YearlyScreen,Screen)

_ENV = YearlyScreen

function YearlyScreen:new(amountObj)
	return setmetatable(Screen:new(amountObj),self)
end

function YearlyScreen:setRange()
	return self:setStopRange(self:getTodayDate()):setStartRange(self:getStartYearDate())
end

return YearlyScreen
