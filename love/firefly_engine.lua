-- Made by HaxiDenti
-- URL: https://github.com/AldieNightStar

require "engine.class"
require "engine.str"
require "engine.list"
require "engine.console"

-- Variables
local v = require "engine.v"

-- JSON support
json = require "engine.json"

-- Hot reload when save
-- Works only in firefly Dev mode
if fireflyDevMode then
	local lick = require "engine.lick"
	lick.reset = true
end

local function do_load()
	v.loadV()
end

local function do_update()
	v.saveV()
end

function init_firefly()
    local wrapper = require "engine.wrapper"
	local updateTimerSec = 0

	-- Load everything
	do_load()

	-- Set wrapper
	wrapper(love.draw, love.update, function(dt)

		-- Before update even happens
		updateTimerSec = updateTimerSec + dt

		-- Every five seconds do updates
		if (updateTimerSec > 5) then
			do_update()
			updateTimerSec = 0
		end

	end)
end