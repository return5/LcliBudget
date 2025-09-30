
local MonthlyExpenses <const> = require('screens.MonthlyExpenses')

local function main()
	MonthlyExpenses.getInstance():callDb():printResults()
end

main()
