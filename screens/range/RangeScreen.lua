
local Screen <const> = require('screens.Screen')

local exit <const> = os.exit
local setmetatable <const> = setmetatable
local match <const> = string.match
local write <const> = io.write


local RangeScreen <const> = {}
RangeScreen.__index = RangeScreen
setmetatable(RangeScreen,Screen)

_ENV = RangeScreen

function RangeScreen:new(amountObj)
	return setmetatable(Screen:new(amountObj),self)
end

local function checkDateFormat(date)
	return match(date,".+%-.+%-.+")
end

function RangeScreen:grabStartRange(args)
	if not args[1] then write("not args[1\n"); exit() end
	if not checkDateFormat(args[1]) then write("not checks format\n"); exit() end
	self:setStartRange(args[1])
	return self
end

function RangeScreen:grabStopRange(args)
	if not args[2] then
		self:setStopRange(self:getTodayDate())
	elseif not checkDateFormat(args[2]) then
		exit()
	else
		self:setStopRange(args[2])
	end
	return self
end

function RangeScreen:setRange(args)
	return self:grabStartRange(args):grabStopRange(args)
end

return RangeScreen
