local setmetatable <const> = setmetatable

local Screen <const> = {}
Screen.__index = Screen

_ENV = Screen

function Screen:new()
	return setmetatable({},self)
end

return Screen
