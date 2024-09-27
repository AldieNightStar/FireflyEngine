local nop = function() end

return function(draw, update, beforeUpdateFn)
	if draw           == nil then draw           = nop end
	if update         == nil then update         = nop end
	if beforeUpdateFn == nil then beforeUpdateFn = nop end
	function love.draw()
		draw()
		__drawFireflyConsole()
	end

	function love.update(dt)
		beforeUpdateFn(dt)
		update(dt)
	end
end