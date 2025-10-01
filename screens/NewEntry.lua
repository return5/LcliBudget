local Screen <const> = require('screens.Screen')
local Database <const> = require('database.Database')
local exit <const> = os.exit
local setmetatable <const> = setmetatable
local write <const> = io.write

local NewEntry <const> = {}
NewEntry.__index = NewEntry
setmetatable(NewEntry,Screen)

_ENV = NewEntry

function NewEntry:new()
	return setmetatable(Screen:new(),self)
end

function NewEntry:execute(args)
	return self:insertNewEntry(args)
end

function NewEntry:insertNewEntry(args)
	if #args < 3 then write("exiting: ",#arg,"\n"); exit() end
	Database.insertRow(args[1],args[2],args[3])
	return self
end

return NewEntry
