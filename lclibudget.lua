#!/usr/bin/env lua
--[[
	LcliBudget: command line program for doing simple budgeting.
    Copyright (C) <2022>  <return5>

    This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License.
    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
    You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.

]]

local source <const> = debug.getinfo(1).source:match("@(.+/).-%.lua") or ""
package.path = package.path .. ";".. source .."?.lua"

local function setPath()
	local pipe <const> = io.popen('echo "$PWD"')
	local dir <const> =  pipe:read()
	pipe:close()
	package.path =  dir .. "/?.lua;" .. package.path
end

setPath()

local FlagParser <const> = require('flagParser.FlagParser')


local function main()
	FlagParser:new():parse(arg):execute(arg)
end

main()
