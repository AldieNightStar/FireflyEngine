Signal = CLASS("std.Signal")

function Signal:connect(func)
	if self._connections == nil then self._connections = {} end
	table.insert(self._connections, func)
end

function Signal:clear(func)
	self._connections = {}
end

function Signal:emit(data)
	if self._connections == nil then return end

	local oldConnections = self._connections
	self._connections = {}

	for _, con in xpairs(oldConnections) do
		if con(data) == true then
			table.insert(self._connections, con)
		end
	end
end
