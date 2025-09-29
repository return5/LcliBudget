local MonthlyExpenses <const> = require('screens.MonthlyExpenses')
local MonthlyIncome <const> = require('screens.MonthlyIncome')
local NetTotal <const> = require('screens.NetTotal')
local YearlyExpenses <const> = require('screens.YearlyExpense')
local YearlyIncome <const> = require('screens.YearlyIncome')
local YearlyNet <const> = require('screens.YearlyNet')
local RangeExpense <const> = require('screens.RangeExpense')
local RangeIncome <const> = require('screens.RangeIncome')
local RangeNet <const> = require('screens.RangeNet')
local NewEntry <const> = require('screens.NewEntry')
local Flag <const> = require('flagParser.Flag')

local setmetatable <const> = setmetatable

local FlagParser <const> = {}
FlagParser.__index = FlagParser

_ENV = FlagParser

local Flags <const> = {
	['-h'] = Flag:new('-h',"print help page"),
	['-e'] = Flag:new('-e','print monthly expenses',MonthlyExpenses),
	['-i'] = Flag:new('-i','print monthly income',MonthlyIncome),
	['-n'] = Flag:new('-n',"print monthly net total",NetTotal),
	['-E'] = Flag:new('-E','print year to date expenses',YearlyExpenses),
	['-I'] = Flag:new('-I','print year to date income',YearlyIncome),
	['-y'] = Flag:new('-y',"print year to date net total",YearlyNet),
	['-'] = Flag:new('-s','print expenses for range',RangeExpense),
	['-'] = Flag:new('-p','print income for range',RangeIncome),
	['-r'] = Flag:new('-r','print net total for range',RangeNet)
}

function FlagParser:parse(args)
	if not args or #args == 0 then return Flags['-h'] end
	if Flags[arg[1]] then return Flags[arg[1]] end
	return Flag:new('',"",NewEntry)
end

function FlagParser:new()
	return setmetatable({},self)
end

return FlagParser
