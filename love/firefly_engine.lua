-- Made by HaxiDenti
-- URL: https://github.com/AldieNightStar

require "engine.xpairs"
require "engine.class"
require "engine.str"
require "engine.list"
require "engine.console"
require "engine.interface"
require "engine.updaters"
require "engine.timer"
require "engine.signal"
require "engine.global_signals"
json = require "engine.json"

function init_firefly()
    local wrapper = require "engine.wrapper"

	-- Set wrapper p r m
	wrapper(love.draw, love.update, love.keypressed, love.keyreleased,
			love.mousepressed, love.mousereleased, love.mousemoved, love.wheelmoved,
			love.gamepadpressed, love.gamepadreleased, love.gamepadaxis
	)
end