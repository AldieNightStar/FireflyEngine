function vpack(v)
	if IS_CLASS(v) then
		-- class tables will be vpacked with special ".class" value in it
		local newValue = {}
		newValue[".class"] = v.NAME
		for field,value in pairs(v) do
			if type(value) == 'function' or field == "NAME" or field == "__class" then
				-- Skip because we don't want to see it in final object
			else
				newValue[field] = vpack(value)
			end
		end
		return newValue
	elseif type(v) == "table" then
		-- Non-class tables will be vpacked without specific logic
		local newValue = {}
		for field,value in pairs(v) do
			newValue[field] = vpack(value)
		end
		return newValue
	else
		-- Other type of object that can't be serialized as objects
		return v
	end
end

function vunpack(v)
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
				instance[field] = vunpack(value)
			end
		end
		return instance
	elseif type(v) == "table" then
		-- If this is just a table value and NOT CLASS
		-- Then we vunpacked everything recursively
		local instance = {}
		for field, value in pairs(v) do
			instance[field] = vunpack(value)
		end
		return instance
	else
		-- Otherwise return AS IS
		return v
	end
end