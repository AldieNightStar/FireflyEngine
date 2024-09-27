console = {
	lines=20,
	fontSize=20
}

local oldPrint = print
local consoleContent = {}

local function addContent(v)
	-- Remove records if too much
	if #consoleContent > console.lines then
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
		love.graphics.print(t, 10, id*console.fontSize)
	end
end