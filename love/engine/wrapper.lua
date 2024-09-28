local v = require("engine.v")

local nop = function() end

return function(draw, update, keypressed, keyreleased, mousePress,
	mouseRel, mouseMove, mouseWheel,
	padPress, padRelease, padAxis
)
	if draw           == nil then draw           = nop end
	if update         == nil then update         = nop end
	if keypressed     == nil then keypressed     = nop end
	if keyreleased    == nil then keyreleased    = nop end
	if mousePress     == nil then mousePress     = nop end
	if mouseRel       == nil then mouseRel       = nop end
	if mouseMove      == nil then mouseMove      = nop end
	if mouseWheel     == nil then mouseWheel     = nop end
	if padPress       == nil then padPress       = nop end
	if padRelease     == nil then padRelease     = nop end
	if padAxis        == nil then padAxis        = nop end
	
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

		signals.keyDown:emit(k)
		keypressed(k, ...)
	end

	function love.keyreleased(k, ...)
		signals.keyUp:emit(k)
		keyreleased(k)
	end

	function love.mousepressed(x, y, button, isTouch)
		signals.mouseDown:emit({x=x, y=y, button=button, touch=isTouch})
		mousePress(x, y, button, isTouch)
	end

	function love.mousereleased(x, y, button, isTouch)
		signals.mouseUp:emit({x=x, y=y, button=button, touch=isTouch})
		mouseRel(x, y, button, isTouch)
	end

	function love.mousemoved(x, y, dx, dy, isTouch)
		signals.mouse:emit({x=x, y=y, dx=dx, dy=dy, touch=isTouch})
		mouseMove(x, y, button, isTouch)
	end

	function love.wheelmoved(x, y)
		signals.mouseWheel:emit({x=x, y=y})
		mouseWheel(x, y)
	end

	function love.gamepadpressed(j, b)
		signals.gamepadDown:emit({gamepad=j, button=b})
		padPress(j, b)
	end

	function love.gamepadreleased(j, b)
		signals.gamepadUp:emit({gamepad=j, button=b})
		padRelease(j, b)
	end

	function love.gamepadaxis( j, axis, value )
		signals.gamepadAxis:emit({gamepad=j, axis=axis, value=value})
		padAxis(j, b)
	end
end