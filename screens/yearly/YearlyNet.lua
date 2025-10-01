--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local YearlyScreen <const> = require('screens.yearly.YearlyScreen')
local Net <const> = require('screens.amounts.Net')

local setmetatable <const> = setmetatable

local YearlyNet <const> = {}
YearlyNet.__index = YearlyNet
setmetatable(YearlyNet,YearlyScreen)

_ENV = YearlyNet

function YearlyNet:new()
	return setmetatable(YearlyScreen:new(Net:new()),self)
end

return YearlyNet
