func = {}

function func.bind(func, ...)
	local args = {...}
	return function(...)
		return func(unpack(args), ...)
	end
end

function func.combine(...)
	local funcs = {...}
	return function(...)
		for _, f in xpairs(funcs) do
			if f ~= nil then
				f(...)
			end
		end
	end
end