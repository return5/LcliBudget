local Screen <const> = require('screens.Screen')

local MonthlyNet <const> = {}
MonthlyNet.__Index = MonthlyNet
setmetatable(MonthlyNet,Screen)

_ENV = MonthlyNet

function MonthlyNet:new()
	return setmetatable(Screen:new(),self)
end

local monthlyNet <const> = MonthlyNet:new()

function MonthlyNet.getInstance()
	return monthlyNet
end

return MonthlyNet
