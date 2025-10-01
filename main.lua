
local MonthlyExpenses <const> = require('screens.monthly.MonthlyExpenses')
local MonthlyNet <const> = require('screens.monthly.MonthlyNet')
local MonthlyIncome <const> = require('screens.monthly.MonthlyIncome')
local YearlyExpense <const> = require('screens.yearly.YearlyExpense')
local YearlyIncome <const> = require('screens.yearly.YearlyIncome')
local YearlyNet <const> = require('screens.yearly.YearlyNet')
local NewEntry <const> = require('screens.NewEntry')

local function main()
--	NewEntry:new():execute(arg)
	MonthlyNet:new():execute()
end

main()
