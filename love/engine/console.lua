console = {
	lines=25,
	fontSize=20
}

local oldPrint = print
local consoleContent = {}
local consolePassedTimeSec = 0

fireflyConsole = {}

local function addContent(v)
	-- Remove records if too much
	if #consoleContent > console.lines then
		table.remove(consoleContent, 1)
	end

	-- Add new record
	table.insert(consoleContent, v)
end

function fireflyConsole.print(...)
	local args = {...}
	local printables = {}
	for _, printable in ipairs(args) do
		table.insert(printables, str(printable))
	end
	addContent(table.concat(printables, " "))
end

function fireflyConsole.draw()
	love.graphics.setColor(1, 1, 1)
	for id, t in ipairs(consoleContent) do
		t = string.gsub(t, "\n", " ")
		t = string.gsub(t, "\t", " ")
		love.graphics.print(t, 10, id*console.fontSize)
	end
end

function fireflyConsole.update(dt)
	-- Remove one record each second
	consolePassedTimeSec = consolePassedTimeSec + dt
	if consolePassedTimeSec > 1 then
		table.remove(consoleContent, 1)
		consolePassedTimeSec = 0
	end
end

function print(...)
	fireflyConsole.print(...)
end