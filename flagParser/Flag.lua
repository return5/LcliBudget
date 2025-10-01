--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local setmetatable <const> = setmetatable
local write <const> = io.write

local Flag <const> = {}
Flag.__index = Flag

_ENV = Flag

function Flag:print()
	write("\t",self.name,"\t",self.description,"\n")
	return self
end

function Flag:new(name,description,screen)
	return setmetatable({name = name,description = description,screen = screen},self)
end

return Flag
