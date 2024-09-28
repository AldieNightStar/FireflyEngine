local nop = function() end

return function(draw, update, beforeUpdateFn, keypressed)
	if draw           == nil then draw           = nop end
	if update         == nil then update         = nop end
	if beforeUpdateFn == nil then beforeUpdateFn = nop end
	if keypressed     == nil then keypressed     = nop end

	function love.draw()
		draw()
		console.draw()
	end

	function love.update(dt)
		beforeUpdateFn(dt)
		update(dt)
	end

	function love.keypressed(k, ...)
		console.key(k)
		keypressed(k, ...)
	end
end