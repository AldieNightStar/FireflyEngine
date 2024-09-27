function CLASS(name, ...)
	local class = {}
	local fields = {...}

	-- Assign name
	class.NAME = name

	-- TODO register class to be able to store to V and restore back

	function class.IS(o)
		local mt = getmetatable(o)
		return mt.__index == class
	end

	function class.new(...)
		local t = {}
		local args = {...}
		setmetatable(t, {__index=class})

		for argId, argValue in ipairs(args) do
			t[fields[argId]] = argValue
		end

		return t
	end

	return class
end