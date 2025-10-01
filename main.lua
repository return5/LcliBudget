
local MonthlyExpenses <const> = require('screens.MonthlyExpenses')
local MonthlyNet <const> = require('screens.MonthlyNet')
local MonthlyIncome <const> = require('screens.MonthlyIncome')
local YearlyExpense <const> = require('screens.YearlyExpense')
local YearlyIncome <const> = require('screens.YearlyIncome')
local YearlyNet <const> = require('screens.YearlyNet')

local function main()
	YearlyNet:new():setRange():callDb():printResults()
end

main()
