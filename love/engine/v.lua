-- Variables support for the engine

V = {}

local filename = "saves_v.json"

local function serialize(v)
	if IS_CLASS(v) then
		-- class tables will be serialized with special ".class" value in it
		local newValue = {}
		newValue[".class"] = v.NAME
		for field,value in pairs(v) do
			if type(value) == 'function' or field == "NAME" or field == "__class" then
				-- Skip because we don't want to see it in final object
			else
				newValue[field] = serialize(value)
			end
		end
		return newValue
	elseif type(v) == "table" then
		-- Non-class tables will be serialized without specific logic
		local newValue = {}
		for field,value in pairs(v) do
			newValue[field] = serialize(value)
		end
		return newValue
	else
		-- Other type of object that can't be serialized as objects
		return v
	end
end

local function deserialize(v)
	local class = nil
	if type(v) == "table" and v[".class"] ~= nil then
		class = CLASS_BY(v[".class"])
	end

	-- If this part is a class, then restore it
	-- It will create empty instance and then populate it will values
	if class ~= nil then
		local class = CLASS_BY(v[".class"])
		local instance = class.new()
		for field, value in pairs(v) do
			if field == ".class" then
				-- Skip ".class" fields
			else
				instance[field] = deserialize(value)
			end
		end
		return instance
	elseif type(v) == "table" then
		-- If this is just a table value and NOT CLASS
		-- Then we deserialize everything recursively
		local instance = {}
		for field, value in pairs(v) do
			instance[field] = deserialize(value)
		end
		return instance
	else
		-- Otherwise return AS IS
		return v
	end
end

local function saveV()
	local js = json.encode(serialize(V))

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

local function loadV()
	if love.filesystem.getInfo(filename) == nil then return end
	local src = love.filesystem.read(filename)
	local loaded = json.decode(src)
	for k, v in pairs(loaded) do
		V[k] = deserialize(v)
	end
end

return {saveV=saveV, loadV=loadV}