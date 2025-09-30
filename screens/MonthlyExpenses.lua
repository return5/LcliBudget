local Screen <const> = require('screens.Screen')

local setmetatable <const> = setmetatable
local sFormat <const> = string.format
local write <const> = io.write

local MonthlyExpenses <const> = {}
MonthlyExpenses.__index = MonthlyExpenses

setmetatable(MonthlyExpenses,Screen)

_ENV = MonthlyExpenses

function MonthlyExpenses:new()
	return setmetatable(Screen:new(),self)
end

local monthlyExpenses <const> = MonthlyExpenses:new()

function MonthlyExpenses.getInstance()
	write("getting instance\n")
	return monthlyExpenses
end
local dateTbl = Screen.date

MonthlyExpenses.query = sFormat('date BETWEEN "%s-%s-%s" AND "%s-%s-%s"',dateTbl.year,dateTbl.month,'01',dateTbl.year,dateTbl.month,dateTbl.day)

return MonthlyExpenses
