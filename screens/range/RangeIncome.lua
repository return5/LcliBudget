--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

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
