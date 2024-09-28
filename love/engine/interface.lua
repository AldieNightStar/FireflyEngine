function INTERFACE(...)
	local required = {...}
	return function(value)
		-- If value is not table, then return false
		if type(value) ~= "table" then return false end

		-- Check that all functions are present
		for _, name in xpairs(required) do
			local func = value[name]
			if func == nil then return false end
			if type(func) ~= "function" then return false end
		end

		-- All set
		return true
	end
end