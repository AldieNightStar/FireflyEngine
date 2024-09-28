local refs = {}

FuncRef = CLASS("std.FuncRef", "funcName")

function FuncRef.register(name, func)
	if type(name) ~= "string" then error("Name for FuncRef should be a function string") end
	if type(func) ~= "function" then return nil end
	refs[name] = func
	return FuncRef.new(name)
end

function FuncRef:CALL(...)
	return self:func()(...)
end

function FuncRef:func()
	-- Take cached function if there
	if self.cachedFunc ~= nil then return self.cachedFunc end

	local func = refs[self.funcName]
	if type(func) ~= 'function' then
		error("FuncRef can't find: " .. self.funcName)
	end

	-- Cache the function for future calls
	self.cachedFunc = func

	return func
end