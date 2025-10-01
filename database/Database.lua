local sqlite3 <const> = require('lsqlite3complete')
local exit <const> = os.exit
local sFormat <const> = string.format
local write <const> = io.write

local Database <const> = {}
Database.__index = Database

_ENV = Database

local function openDb()
	local db <const>, code <const>, errorMessage <const> = sqlite3.open("/home/chris/Documents/books/budget.sqlite")
	if not db then write(errorMessage,"\n"); exit() end
	return db
end

local db <const> = openDb()

function Database.insertRow(date,value,note)
	local query <const> = sFormat('insert INTO budget (date,amount,note) VALUES ("%s",%s,"%s");',date,value,note or "")
	db:exec(query)
	return Database
end

function Database.selectRows(query)
	local rows <const> = {}
	for row in db:nrows(query) do
		rows[#rows + 1] = row
	end
	return rows
end

return Database

