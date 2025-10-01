--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local Screen <const> = require('screens.Screen')

local pairs <const> = pairs
local setmetatable <const> = setmetatable
local write <const> = io.write

local HelpScreen <const> = {}
HelpScreen.__index = HelpScreen

setmetatable(HelpScreen,Screen)

_ENV = HelpScreen

HelpScreen.flags = nil --forward declared. set in flag parser to avoid dependency loop.

function HelpScreen:execute()
	write("command line budget: manage budget from command line.\ncliBudget arg [startRange] [stopRange]\ncliBudet date value [note]\nnotice: date must be in ISO-8601 format\n")
	for _,flag in pairs (self.flags) do
		flag:print()
	end
	write("\n")
end

function HelpScreen:new()
	return setmetatable(Screen:new(),self)
end

return HelpScreen
