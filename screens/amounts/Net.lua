--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local setmetatable <const> = setmetatable
local write <const> = io.write

local Net <const> = { query = ""}
Net.__index = Net

_ENV = Net

function Net:print()
	write('income total: ',self.incomeTotal,"\n")
	write('expenses total: ',self.expenseTotal,"\n")
	write('net total: ',self.incomeTotal + self.expenseTotal,"\n")
end

function Net:new()
	return setmetatable({incomeTotal = 0,expenseTotal = 0},self)
end

function Net:addToTotal(value)
	if value > 0 then
		self.incomeTotal = self.incomeTotal + value
	else
		self.expenseTotal = self.expenseTotal + value
	end
end

return Net
