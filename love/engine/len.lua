function LEN(array)
	local id = -1
	for i, _ in pairs(array) do
		if type(i) == "number" then
			if i > id then
				id = i
			end
		end
	end
	if id < 0 then return 0 end
	return id
end