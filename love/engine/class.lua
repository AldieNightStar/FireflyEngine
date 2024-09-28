local classes = {}

local function call_in_class(class, ...)
	if type(class) ~= "table" then return end
	if class.CALL == nil then return end
	return class.CALL(...)
end

function CLASS_BY(name)
	return classes[name]
end

function IS_CLASS(v)
	if type(v) ~= "table" then return false end
	if v.NAME == nil then return false end
	return v.__class == true
end

function CLASS(name, ...)
	local class = {}
	local fields = {...}

	-- Assign name
	class.NAME = name

	-- Mark the value
	class.__class = true

	-- Register class
	classes[name] = class

	function class.IS(o)
		local mt = getmetatable(o)
		if mt == nil then return false end
		return mt.__index == class
	end

	function class.new(...)
		local t = {}
		local args = {...}
		setmetatable(t, {
			__index=class,
			__call=function(...) return call_in_class(t, ...) end
		})

		for argId, argValue in xpairs(args) do
			t[fields[argId]] = argValue
		end

		return t
	end

	return class
end