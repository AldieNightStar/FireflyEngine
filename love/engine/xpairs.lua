function xpairs(t)
	local size = #t
	local i = 0
	return function()
		if i < size then
			i = i + 1
			return i, t[i]
		else
			return nil
		end
	end
end