List = CLASS("std.List")

function List:add(el)
	if self._elements == nil then self._elements = {} end
	table.insert(self._elements, el)
	return #self._elements
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

function List:remove(el)
	if self._elements == nil then return nil end
	local id = self:index(el)
	if id == nil then return false end
	table.remove(self._elements, id)
end

function List:size()
	if self._elements == nil then return 0 end
	return #self._elements
end

function List:isEmpty()
	return self:size() < 1
end

function List:isNotEmpty()
	return self:size() > 0
end

function List:removeAt(n)
	if self._elements == nil then self._elements = {} end
	table.remove(self._elements, n)
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

function List:string()
	return "List:" .. str(self._elements)
end