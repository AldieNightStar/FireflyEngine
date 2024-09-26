function str(value)
	if type(value) == "table" then
		-- IF IT HAS toString FUNCTION
		if value.toString then return value:toString() end

		-- Create String builder array
		local sb = {}
		
		-- ARRAY
		if value[1] ~= nil then
			for _, val in ipairs(value) do
				table.insert(sb, str(val))
			end
		else
			-- OBJECT
			for key, val in pairs(value) do
				table.insert(sb, key.."="..str(val))
			end
		end

		-- concat and return
		local str = table.concat(sb, ", ")
		return "{"..str.."}"
	else
		-- Not an object
		-- Something else
		return tostring(value)
	end
end