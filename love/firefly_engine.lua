-- Made by HaxiDenti
-- URL: https://github.com/AldieNightStar

require "engine.class"
require "engine.str"
require "engine.list"
require "engine.console"
require "engine.interface"
require "engine.updaters"
require "engine.timer"
json = require "engine.json"

function init_firefly()
    local wrapper = require "engine.wrapper"

	-- Set wrapper
	wrapper(love.draw, love.update, love.keypressed)
end