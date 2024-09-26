local oldPrint = print
local consoleContent = {}
local consoleSize = 20
local fontSize = 20

local function addContent(v)
	-- Remove records if too much
	if #consoleContent > consoleSize then
		table.remove(consoleContent, 1)
	end

	-- Add new record
	table.insert(consoleContent, str(v))
end

function print(t)
	addContent(t)
end

function __drawFireflyConsole()
	for id, t in ipairs(consoleContent) do
		t = string.gsub(t, "\n", " ")
		t = string.gsub(t, "\t", " ")
		love.graphics.print(t, 10, id*fontSize)
	end
end