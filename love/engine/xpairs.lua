local function iteratorForList(list)
	local i = 0
	local size = list:size()
	return function()
		if i < size then
			i = i + 1
			return i, list:get(i)
		else
			return nil
		end
	end
end

local function iteratorForArray(array)
	local i = 0
	local size = LEN(array)
	return function()
		if i < size then
			i = i + 1
			return i, array[i]
		else
			return nil
		end
	end
end

function xpairs(t)
	if (List.IS(t)) then
		return iteratorForList(t)
	else
		return iteratorForArray(t)
	end
end