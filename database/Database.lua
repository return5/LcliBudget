--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local sqlite3 <const> = require('lsqlite3complete')
local Config <const> = require('config.Config')
local exit <const> = os.exit
local sFormat <const> = string.format
local write <const> = io.write

local Database <const> = {}
Database.__index = Database

_ENV = Database

local function openDb()
	local db <const>, _, errorMessage <const> = sqlite3.open(Config.location)
	if not db then write(errorMessage,"\n"); exit() end
	return db
end

local db <const> = openDb()

function Database.insertRow(date,value,note)
	local query <const> = sFormat('insert INTO %s(date,amount,note) VALUES ("%s",%s,"%s");',Config.tableName,date,value,note or "")
	db:exec(query)
	return Database
end

function Database.selectRows(query)
	local rows <const> = {}
	for row in db:nrows(query) do
		rows[#rows + 1] = row
	end
	return rows
end

return Database

