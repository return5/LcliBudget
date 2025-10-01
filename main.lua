
local MonthlyExpense <const> = require('screens.monthly.MonthlyExpenses')
local MonthlyNet <const> = require('screens.monthly.MonthlyNet')
local MonthlyIncome <const> = require('screens.monthly.MonthlyIncome')
local YearlyExpense <const> = require('screens.yearly.YearlyExpense')
local YearlyIncome <const> = require('screens.yearly.YearlyIncome')
local YearlyNet <const> = require('screens.yearly.YearlyNet')
local NewEntry <const> = require('screens.NewEntry')
local RangeExpense <const> = require('screens.range.RangeExpense')
local RangeIncome <const> = require('screens.range.RangeIncome')


local function main()
	YearlyIncome:new():execute(arg)
end

main()
