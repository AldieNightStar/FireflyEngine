local v = require("engine.v")

local nop = function() end

return function(draw, update, keypressed)
	if draw           == nil then draw           = nop end
	if update         == nil then update         = nop end
	if keypressed     == nil then keypressed     = nop end
	
	-- Load variables
	v.load()

	-- Save variables timer
	local VSaveTimer = setTimer(5, function() v.save() end):repeating()

	function love.draw()
		draw()
		console.draw()
	end

	function love.update(dt)
		update(dt)
		updateUpdaters(dt)
	end

	function love.keypressed(k, ...)
		-- Call console actions
		-- If console returns true, then no more key processing
		if console.key(k) then return end

		keypressed(k, ...)
	end
end