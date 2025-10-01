
--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

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
