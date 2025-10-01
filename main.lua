
local MonthlyExpenses <const> = require('screens.MonthlyExpenses')
local MonthlyNet <const> = require('screens.MonthlyNet')
local MonthlyIncome <const> = require('screens.MonthlyIncome')

local function main()
	MonthlyNet:new():setRange():callDb():printResults()
end

main()
