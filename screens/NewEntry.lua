--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local Screen <const> = require('screens.Screen')
local Database <const> = require('database.Database')
local exit <const> = os.exit
local setmetatable <const> = setmetatable

local NewEntry <const> = {}
NewEntry.__index = NewEntry
setmetatable(NewEntry,Screen)

_ENV = NewEntry

function NewEntry:new()
	return setmetatable(Screen:new(),self)
end

function NewEntry:execute(args)
	return self:insertNewEntry(args)
end

function NewEntry:insertNewEntry(args)
	if #args < 3 then exit() end
	Database.insertRow(args[1],args[2],args[3])
	return self
end

return NewEntry
