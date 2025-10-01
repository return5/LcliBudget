--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local setmetatable <const> = setmetatable
local write <const> = io.write

local Expense <const> = {query = "and amount < 0"}
Expense.__index = Expense

_ENV = Expense

function Expense:print()
	write("expenses total: ",self.total,"\n")
end

function Expense:new()
	return setmetatable({total = 0},self)
end

function Expense:addToTotal(value)
	self.total = self.total + value
end

return Expense
