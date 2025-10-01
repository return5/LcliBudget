local Screen <const> = require('screens.Screen')

local pairs <const> = pairs
local setmetatable <const> = setmetatable
local write <const> = io.write

local HelpScreen <const> = {}
HelpScreen.__index = HelpScreen

setmetatable(HelpScreen,Screen)

_ENV = HelpScreen

function HelpScreen:execute()
	write("command line budget: manage budget from command line.\n")
	for _,flag in pairs (self.flagsTable) do
		write("\t",flag.name,"\t",flag.description,"\n")
	end
	write("\n")
end

function HelpScreen:new()
	return setmetatable(Screen:new(),self)
end

return HelpScreen
