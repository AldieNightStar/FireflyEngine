# Signals

## Notes
* Signals allows you code game with `Observer` pattern
* We can emit the signal, and __connected__ object will listen to them
* ⚠️ Each connection have to return `true` or `false` to indicate that it will continue to listen, otherwise disconnect
* ⚠️ __NOTE:__ that each object, that is connected to the Signal, should always disconnect (Return `false`) when they die, or something happens
	* Otherwise it will cause Memory to leak and game to crash in future

## Create Signals
```lua
-- Just create Signal and put it somewhere publicly
mySignal = Signal.new()
```

## Listen to Signal
```lua
mySignal:connect(function(data)
	-- data - is an Emit value

	-- If 'true' then it will continue to be connected
	-- If 'false' then signal will disconnect after that
	return true
end)
```

## Emit the Signal
```lua
-- Emit the signal will cause all listeners to listen that event
-- Every connection function will have data as "I like apples"
mySignal:emit("I like apples")
```


## Clear
```lua
-- You can clear the signal when for example you change the scene, or reload the game
mySignal:clear()
```