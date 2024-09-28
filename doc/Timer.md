# Timers

## Notes
* Used for timing or to schedule function calls each amount of time
* Can be created with `setTimer` function
* Can be stopped with `timer:stop` function

## Usage
```lua

-- Create Timer that will repeat each time
-- function should accept Timer argument, so it can stop it, when need
local t = setTimer(seconds, func):repeating()

-- Create Timer that will be called once
-- function should accept Timer argument, so it can stop it, when need
local t = setTimer(seconds, func):once()

-- Stop that timer
-- After that it will be unusable. Need to create new
t:stop()

-- Change Timer interval in seconds
t:interval(3)

-- Change timer callback function
t:callback(function(t) end)
```