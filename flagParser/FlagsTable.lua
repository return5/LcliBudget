--[[
	This file is part of LcliBudget.

	LcliBudget is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License only.
	LcliBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	You should have received a copy of the GNU General Public License along with cliBudget. If not, see <https://www.gnu.org/licenses/>.
]]

local MonthlyExpenses <const> = require('screens.monthly.MonthlyExpenses')
local MonthlyIncome <const> = require('screens.monthly.MonthlyIncome')
local NetTotal <const> = require('screens.monthly.MonthlyNet')
local YearlyExpenses <const> = require('screens.yearly.YearlyExpense')
local YearlyIncome <const> = require('screens.yearly.YearlyIncome')
local YearlyNet <const> = require('screens.yearly.YearlyNet')
local RangeExpense <const> = require('screens.range.RangeExpense')
local RangeIncome <const> = require('screens.range.RangeIncome')
local RangeNet <const> = require('screens.range.RangeNet')
local HelpScreen <const> = require('screens.HelpScreen')
local Flag <const> = require('flagParser.Flag')

return {
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
