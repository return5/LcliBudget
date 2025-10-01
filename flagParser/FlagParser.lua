local MonthlyExpenses <const> = require('screens.monthly.MonthlyExpenses')
local MonthlyIncome <const> = require('screens.monthly.MonthlyIncome')
local NetTotal <const> = require('screens.monthly.MonthlyNet')
local YearlyExpenses <const> = require('screens.yearly.YearlyExpense')
local YearlyIncome <const> = require('screens.yearly.YearlyIncome')
local YearlyNet <const> = require('screens.yearly.YearlyNet')
local RangeExpense <const> = require('screens.range.RangeExpense')
local RangeIncome <const> = require('screens.range.RangeIncome')
local RangeNet <const> = require('screens.range.RangeNet')
local NewEntry <const> = require('screens.NewEntry')
local HelpScreen <const> = require('screens.HelpScreen')
local Flag <const> = require('flagParser.Flag')

local setmetatable <const> = setmetatable

local FlagParser <const> = {}
FlagParser.__index = FlagParser

_ENV = FlagParser

local Flags <const> = {
	['-h'] = Flag:new('-h',"print help page",HelpScreen:new()),
	['-e'] = Flag:new('-e','print monthly expenses',MonthlyExpenses:new()),
	['-i'] = Flag:new('-i','print monthly income',MonthlyIncome:new()),
	['-n'] = Flag:new('-n',"print monthly net total",NetTotal:new()),
	['-E'] = Flag:new('-E','print year to date expenses',YearlyExpenses:new()),
	['-I'] = Flag:new('-I','print year to date income',YearlyIncome:new()),
	['-y'] = Flag:new('-y',"print year to date net total",YearlyNet:new()),
	['-'] = Flag:new('-s','print expenses for range',RangeExpense:new()),
	['-'] = Flag:new('-p','print income for range',RangeIncome:new()),
	['-r'] = Flag:new('-r','print net total for range',RangeNet:new())
}
Flags['-h'].screen.flagsTable = Flags

function FlagParser:parse(args)
	if not args or #args == 0 then return Flags['-h'] end
	if Flags[args[1]] then return Flags[args[1]].screen end
	return NewEntry:new()
end

function FlagParser:new()
	return setmetatable({},self)
end

return FlagParser
