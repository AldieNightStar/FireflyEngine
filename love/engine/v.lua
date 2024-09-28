-- Variables support for the engine

V = {}

local filename = "saves_v.json"

local function save()
	local js = json.encode(vpack(V))

	-- Remove old file
	if love.filesystem.getInfo(filename) ~= nil then
		love.filesystem.remove(filename)
	end

	-- Create new file
	local file = love.filesystem.newFile(filename)

	-- Write file
	file:open('w')
	file:write(js)
	file:close()
end

local function load()
	if love.filesystem.getInfo(filename) == nil then return end
	local src = love.filesystem.read(filename)
	local loaded = json.decode(src)
	for k, v in pairs(loaded) do
		V[k] = vunpack(v)
	end
end

return {save=save, load=load}