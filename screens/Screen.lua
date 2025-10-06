--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local Database <const> = require('database.Database')
local Config <const> = require('config.Config')

local setmetatable <const> = setmetatable
local write <const> = io.write
local osDate <const> = os.date
local sFormat <const> = string.format
local match <const> = string.match

local Screen <const> = {query = sFormat("SELECT date, amount,note FROM %s WHERE date BETWEEN",Config.tableName),date = osDate("*t")}
Screen.__index = Screen

_ENV = Screen

local function addZerosToDate()
	if Screen.date.month < 10 then Screen.date.month = 0 .. Screen.date.month end
	if Screen.date.day < 10 then Screen.date.day = 0 .. Screen.date.day end
end

addZerosToDate()

function Screen:callDb()
	local query <const> = sFormat('%s %s AND %s %s ORDER BY date DESC',Screen.query,self.startRange,self.stopRange,self.amountObj.query)
	self.results = Database.selectRows(query)
	return self
end

function Screen:printResults()
	for i=1,#self.results,1  do
		local row <const> = self.results[i]
		write(row.date," | ",row.amount, " | ", row.note,"\n")
		self.amountObj:addToTotal(row.amount)
	end
	self.amountObj:print()
	return self
end

function Screen.checkDateFormat(date)
	return match(date,".+%-.+%-.+")
end

function Screen:setStartRange(startDate)
	self.startRange = sFormat('"%s"',startDate)
	return self
end

function Screen:setStopRange(stopDate)
	self.stopRange = sFormat('"%s"',stopDate)
	return self
end

function Screen:getStartYearDate()
	return sFormat('%s-%s-%s',Screen.date.year,'01','01')
end

function Screen:getStartMonthDate()
	return sFormat('%s-%s-%s',Screen.date.year,Screen.date.month,'01')
end

function Screen:getTodayDate()
	return sFormat('%s-%s-%s',Screen.date.year,Screen.date.month,Screen.date.day)
end

function Screen:setRange()
	return self
end

function Screen:execute(arg)
	self:setRange(arg):callDb():printResults()
	return self
end

function Screen:new(amountObj)
	return setmetatable({results = {},amountObj = amountObj },self)
end

return Screen
