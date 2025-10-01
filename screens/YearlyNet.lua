local YearlyScreen <const> = require('screens.YearlyScreen')
local Net <const> = require('screens.Net')

local setmetatable <const> = setmetatable

local YearlyNet <const> = {}
YearlyNet.__index = YearlyNet
setmetatable(YearlyNet,YearlyScreen)

_ENV = YearlyNet

function YearlyNet:new()
	return setmetatable(YearlyScreen:new(Net:new()),self)
end

return YearlyNet
