console = {
	lines=25,
	fontSize=20,
	maxLineSize=130,
	enabled=true,
}

local oldPrint = print
local consoleContent = {}

local function isRelease(v) return fireflyDevMode == false end

local function addContent(v)
	local remainder = nil

	-- Remove records if too much
	if #consoleContent > console.lines then
		table.remove(consoleContent, 1)
	end

	if #v > console.maxLineSize then
		-- Take remainder
		remainder = string.sub(v, console.maxLineSize+1)

		-- Save current
		v = string.sub(v, 1, console.maxLineSize)
	end

	-- Add new record
	table.insert(consoleContent, v)

	-- If there is some remainder then print also
	if remainder ~= nil then addContent(remainder) end
end

function console.print(...)
	-- Do not do anything in RELEASE
	if isRelease() then return end

	local args = {...}
	local printables = {}
	for _, printable in xpairs(args) do
		table.insert(printables, str(printable))
	end
	addContent(table.concat(printables, " "))
end

function console.draw()
	-- Do not do anything in RELEASE
	if isRelease() then return end

	-- Do not draw if console is disabled
	if not console.enabled then return end

	-- Shorthands
	local gfx = love.graphics
	local col = gfx.setColor

	-- Console dimmed background
	col(0, 0, 0, 0.2)
	gfx.rectangle('fill', 0, 0, gfx.getWidth(), gfx.getHeight())

	-- Set up the font size
	local font = gfx.newFont(console.fontSize)
	gfx.setFont(font)

	for id, t in xpairs(consoleContent) do
		t = string.gsub(t, "\n", " ")
		t = string.gsub(t, "\t", " ")

		-- Print black shadow back
		col(0.1, 0.1, 0.1, 1)
		gfx.print(t, 12, (id*console.fontSize) + 2)

		-- Print white
		col(1, 1, 1, 1)
		gfx.print(t, 10, id*console.fontSize)
	end
end

function console.key(k)
	-- Do not do anything in RELEASE
	if isRelease() then return false end
	
	if k == "`" then
		console.enabled = not console.enabled
		return true
	end

	return false
end

function print(...)
	console.print(...)
end