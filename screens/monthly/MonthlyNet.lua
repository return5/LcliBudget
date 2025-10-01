local Net <const> = require('screens.amounts.Net')
local MonthlyScreen <const> = require('screens.monthly.MonthlyScreen')
local setmetatable <const> = setmetatable

local MonthlyNet <const> = {}
MonthlyNet.__index = MonthlyNet
setmetatable(MonthlyNet,MonthlyScreen)

_ENV = MonthlyNet

function MonthlyNet:new()
	return setmetatable(MonthlyScreen:new(Net:new()),self)
end

return MonthlyNet
