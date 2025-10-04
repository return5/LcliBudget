--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local NewEntry <const> = require('screens.NewEntry')
local Flags <const> = require('flagParser.FlagsTable')
local HelpScreen <const> = require('screens.HelpScreen')
local write <const> = io.write

local setmetatable <const> = setmetatable

local FlagParser <const> = {}
FlagParser.__index = FlagParser

_ENV = FlagParser

HelpScreen.flags = Flags

function FlagParser:parse(args)
	write("arg[1] is: ",args[1],"\n")
	if not args or #args == 0 then return Flags['-h'].screen end
	if Flags[args[1]] then write("returning arg\n"); return Flags[args[1]].screen end
	return NewEntry:new()
end

function FlagParser:new()
	return setmetatable({},self)
end

return FlagParser
