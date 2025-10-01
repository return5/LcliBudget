local RangeScreen <const> = require('screens.range.RangeScreen')
local Net <const> = require('screens.amounts.Net')

local setmetatable <const> = setmetatable

local RangeNet <const> = {}
RangeNet.__index = RangeNet
setmetatable(RangeNet, RangeScreen)

_ENV = RangeNet

function RangeNet:new()
	return setmetatable(RangeScreen:new(Net:new()),self)
end

return RangeNet
