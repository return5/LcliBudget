local Screen <const> = require('screens.Screen')

local YearlyNet <const> = {}
YearlyNet.__Index = YearlyNet
setmetatable(YearlyNet,Screen)

_ENV = YearlyNet

function YearlyNet:new()
	return setmetatable(Screen:new(),self)
end

local yearlyNet <const> = YearlyNet:new()

function YearlyNet.getInstance()
	return yearlyNet
end

return YearlyNet
