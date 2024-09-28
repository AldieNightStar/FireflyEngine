local timers = {}

Timer = CLASS("std.Timer",
	"timePassed",
	"_interval",
	"stopped",
	"isOnce",
	"_callback"
)

function setTimer(intervalSec, func)
	if intervalSec < 0.01 then intervalSec = 0.01 end
	local t = Timer.new(0, intervalSec, false, true, func)
	table.insert(timers, t)
	print(timers)
	return t
end

function Timer:_update(dt)
	if self.stopped then return end

	self.timePassed = self.timePassed + dt
	if self.timePassed > self._interval then
		self.timePassed = self.timePassed - self._interval
		if self.isOnce then self.stopped = true end
		self._callback(self)
	end
end

function Timer:stop()
	self.stopped = true
end

function Timer:once()
	self.isOnce = true
	return this
end

function Timer:repeating()
	self.isOnce = false
	return this
end

function Timer:interval(sec)
	self._interval = sec
	return this
end

function Timer:callback(cb)
	self._callback = cb
	return this
end

local function removeStoppedTimers()
	local newList = {}
	for _, t in ipairs(timers) do
		if not t.stopped then
			table.insert(newList, t)
		end
	end
	timers = newList
end

addUpdater("fireflyUpdateTimers", function(dt, name)
	for _, t in ipairs(timers) do
		t:_update(dt)
	end
	removeStoppedTimers()
end)