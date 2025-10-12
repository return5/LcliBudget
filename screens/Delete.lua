local DB <const> = require('database.Database')
local Screen <const> = require('screens.Screen')

local setmetatable <const> = setmetatable
local exit <const> = os.exit
local match <const> = string.match

local Delete <const> = {}
Delete.__index = Delete
setmetatable(Delete,Screen)

_ENV = Delete

local function getRowId(id)
	if not id or not match(id,"^%d+$") then exit() end
	return id
end

function Delete:execute(args)
	local rowId <const> = getRowId(args[2])
	DB.removeRow(rowId)
	return self
end

function Delete:new()
	return setmetatable(Screen:new(),self)
end

return Delete
