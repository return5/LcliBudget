local Screen <const> = require('screens.Screen')
local setmetatable <const> = setmetatable

local HelpScreen <const> = {}
HelpScreen.__index = HelpScreen

setmetatable(HelpScreen,Screen)

_ENV = HelpScreen

function HelpScreen:new()
	return setmetatable(Screen:new(),self)
end

return HelpScreen
