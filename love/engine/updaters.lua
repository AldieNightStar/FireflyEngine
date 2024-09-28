local updaters = {}

function updateUpdaters(dt)
	for name, u in pairs(updaters) do
		u(dt, name)
	end
end

function addUpdater(name, func)
	updaters[name] = func
end

function removeUpdater(name)
	updaters[name] = nil
end