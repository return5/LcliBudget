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
local match <const> = string.match
local stdErr <const> = io.stderr

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

function NewEntry:getDate(date)
	if not self.checkDateFormat(date) then return self:getTodayDate() end
	return date
end

local function checkForNumber(str)
	return match(str,'^%-?[%d.]+$')
end

local function getAmount(args)
	for i=1,#args,1 do
		if checkForNumber(args[i]) then return args[i] end
	end
	stdErr:write("Error: did not include an amount\n")
	exit()
end

local function getNote(amount,args)
	if #args == 3 then return args[3] end
	return amount ~= args[2] and args[2] or args[3]
end

function NewEntry:insertNewEntry(args)
	local date <const> = self:getDate(args[1])
	local amount <const> = getAmount(args)
	local note <const> = getNote(amount,args)
	Database.insertRow(date,amount,note)
	return self
end

return NewEntry
