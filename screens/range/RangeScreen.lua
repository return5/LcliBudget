--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local Screen <const> = require('screens.Screen')

local exit <const> = os.exit
local stdErr <const> = io.stderr
local setmetatable <const> = setmetatable

local RangeScreen <const> = {}
RangeScreen.__index = RangeScreen
setmetatable(RangeScreen,Screen)

_ENV = RangeScreen

function RangeScreen:new(amountObj)
	return setmetatable(Screen:new(amountObj),self)
end

function RangeScreen:grabStartRange(args)
	if not args[2] then stdErr:write("Error: no range given.\n"); exit() end
	if not self.checkDateFormat(args[2]) then stdErr:write("Error: Invalid range format given.\n"); exit() end
	self:setStartRange(args[2])
	return self
end

function RangeScreen:grabStopRange(args)
	if not args[3] then
		self:setStopRange(self:getTodayDate())
	elseif not self.checkDateFormat(args[3]) then
		exit()
	else
		self:setStopRange(args[3])
	end
	return self
end

function RangeScreen:setRange(args)
	return self:grabStartRange(args):grabStopRange(args)
end

return RangeScreen
