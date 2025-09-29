local Screen <const> = require('screens.Screen')

local NewEntry <const> = {}
NewEntry.__Index = NewEntry
setmetatable(NewEntry,Screen)

_ENV = NewEntry

function NewEntry:new()
	return setmetatable(Screen:new(),self)
end

local monthlyExpenses <const> = NewEntry:new()

function NewEntry.getInstance()
	return monthlyExpenses
end

return NewEntry
