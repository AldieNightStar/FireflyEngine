return function(draw, update)
	if draw   == nil then draw   = function() end end
	if update == nil then update = function() end end
	function love.draw()
		draw()
		__drawFireflyConsole()
	end

	function love.update(dt)
		update(dt)
	end
end