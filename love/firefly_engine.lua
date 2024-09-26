require "engine.class"
require "engine.str"
require "engine.list"
require "engine.console"

function init_firefly()
    local wrapper = require "engine.wrapper"
	wrapper(love.draw, love.update)
end