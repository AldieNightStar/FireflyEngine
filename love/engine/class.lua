function CLASS(...)
	local class = {}
	local fields = {...}

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