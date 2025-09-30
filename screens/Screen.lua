local Database <const> = require('database.Database')
local setmetatable <const> = setmetatable
local pairs <const> = pairs
local write <const> = io.write
local date <const> = os.date

local Screen <const> = {query = "SELECT date, amount,note from budget where ",date = date("*t")}
Screen.__index = Screen

_ENV = Screen

local function addZerosToDate()
	if Screen.date.month < 10 then Screen.date.month = 0 .. Screen.date.month end
	if Screen.date.day < 10 then Screen.date.day = 0 .. Screen.date.day end
end

addZerosToDate()

function Screen:callDb()
	write("calling bd with query: ",Screen.query .. self.query,"\n")
	self.results = Database.selectRows(Screen.query .. self.query)
	return self
end

function Screen:printResults()
	local total = 0
	for i=1,#self.results,1  do
		local row <const> = self.results[i]
		write(row.date," | ",row.amount, " | ", row.note,"\n")
		total = total + row.amount
	end
	write("total: ",total,"\n")
	return self
end

function Screen:new()
	return setmetatable({results = {}},self)
end

return Screen
