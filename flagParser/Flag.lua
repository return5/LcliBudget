local setmetatable <const> = setmetatable
local write <const> = io.write

local Flag <const> = {}
Flag.__index = Flag

_ENV = Flag

function Flag:print()
	write("\t",self.name,"\t",self.description,"\n")
	return self
end

function Flag:new(name,description,screen)
	return setmetatable({name = name,description = description,screen = screen},self)
end

return Flag
