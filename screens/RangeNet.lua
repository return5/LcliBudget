local Screen <const> = require('screens.Screen')

local RangeNet <const> = {}
RangeNet.__Index = RangeNet
setmetatable(RangeNet,Screen)

_ENV = RangeNet

function RangeNet:new()
	return setmetatable(Screen:new(),self)
end

local rangeNet <const> = RangeNet:new()

function RangeNet.getInstance()
	return rangeNet
end

return RangeNet
