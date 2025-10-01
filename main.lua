
local FlagParser <const> = require('flagParser.FlagParser')

local function main()
	FlagParser:new():parse(arg):execute(arg)
end

main()
