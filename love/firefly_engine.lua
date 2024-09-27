require "engine.class"
require "engine.str"
require "engine.list"
require "engine.console"

-- Hot reload when save
local lick = require "engine.lick"
lick.reset = true

function init_firefly()
    local wrapper = require "engine.wrapper"
	wrapper(love.draw, love.update)
end