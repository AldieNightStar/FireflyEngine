List = CLASS("std.List")

function List.of(items)
	local list = List.new()
	for i, v in xpairs(items) do
		list:add(v)
	end
	return list
end

function List:add(el)
	if self._elements == nil then self._elements = {} end
	if self._size == nil then self._size = 0 end
	self._elements[self._size + 1] = el
	self._size = self._size + 1
	return self._size
end

function List:fill(count, func)
	for i = 1, count do
		self:add(func(i))
	end
end

function List:index(el)
	if self._elements == nil then return nil end
	for id, value in xpairs(self._elements) do
		if value == el then return id end
	end
	return nil
end

function List:get(id)
	if self._elements == nil then return nil end
	return self._elements[id]
end

function List:size()
	if self._elements == nil then return 0 end
	if self._size     == nil then return 0 end
	return self._size
end

function List:isEmpty()
	return self:size() < 1
end

function List:isNotEmpty()
	return self:size() > 0
end

function List:filter(fn)
	if self._elements == nil then return List.new() end
	local newList = List.new()
	for id, value in xpairs(self._elements) do
		if (fn(value)) then
			newList:add(value)
		end
	end
	return newList
end

function List:map(fn, removeNils)
	if self._elements == nil then return List.new() end
	local newList = List.new()
	for id, value in xpairs(self._elements) do
		if removeNils then
			local mapped = fn(value)
			if mapped ~= nil then
				newList:add(mapped)
			end
		else
			newList:add(fn(value))
		end
	end
	return newList
end

function List:range(start, _end)
	if self._elements == nil then return List.new() end
	local newList = List.new()
	for id, value in xpairs(self._elements) do
		if id >= start and id <= _end then
			newList:add(value)
		end
	end
	return newList
end

function List:concat(delim)
	if self._size     == nil then return "" end
	if self._elements == nil then return "" end

	if delim == nil then delim = ", " end
	local values = {}
	local size = self._size
	for i, v in xpairs(self._elements) do
		table.insert(values, str(v))
		-- Add delim if end yet
		if i < size then table.insert(values, delim) end
	end
	return table.concat(values, "")
end

function List:string()
	return "List:{" .. self:concat(", ") .. "}"
end

function List:unpack()
	return unpack(self._elements)
end

function List:items() return xpairs(self) end