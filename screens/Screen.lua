local Database <const> = require('database.Database')
local setmetatable <const> = setmetatable
local write <const> = io.write
local date <const> = os.date
local sFormat <const> = string.format

local Screen <const> = {query = "SELECT date, amount,note FROM budget WHERE date BETWEEN",date = date("*t")}
Screen.__index = Screen

_ENV = Screen

local function addZerosToDate()
	if Screen.date.month < 10 then Screen.date.month = 0 .. Screen.date.month end
	if Screen.date.day < 10 then Screen.date.day = 0 .. Screen.date.day end
end

addZerosToDate()

function Screen:callDb()
	local query <const> = sFormat('%s %s AND %s %s',Screen.query,self.startRange,self.stopRange,self.amountObj.query)
	write("calling bd with query: ",query,"\n")
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

function Screen:setStartRange(startDate)
	self.startRange = startDate
	return self
end

function Screen:setStopRange(stopDate)
	self.stopRange = stopDate
	return self
end

function Screen:getStartYearDate()
	return sFormat('"%s-%s-%s"',Screen.date.year,'01','01')
end

function Screen:getStartMonthDate()
	return sFormat('"%s-%s-%s"',Screen.date.year,Screen.date.month,'01')
end

function Screen:getTodayDate()
	return sFormat('"%s-%s-%s"',Screen.date.year,Screen.date.month,Screen.date.day)
end

function Screen:setRange()
	return self
end

function Screen:new(amountObj)
	return setmetatable({results = {},amountObj = amountObj },self)
end

return Screen
