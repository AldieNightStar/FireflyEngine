# Functions `func`

## Notes
* Small collection of functional functions
* Allows to do some minimal functional stuff

## Functions Combining
* Creates a single function from a collection of other functions
* When called, then all the functions inside gets called with __the same arguments__
* Good to create some `flow` between functions
```lua
local f = func.combine(
	function() say("Hello world") end,
	function() say("Hi Roger!") end
)
```


## Parameters binding
* Creates a copy of specific function with bound first arguments
* When newly-created function gets called, these arguments always added at the beginning
```lua
-- Let's imaging we have a function
function sayMessage(name, mood, text)
	-- ...
end

-- Creates function copy that will have bound arguments at start
local funkyHaxi = func.bind(sayMessage, "Haxi", "Funky")
local sadAldie = func.bind(sayMessage, "Aldie", "Sad")

funkyHaxi("Hello there") -- same as: sayMessage("Haxi", "Funky", "Hello there")
sadAldie("Oh, hi Haxi!") -- same as: sayMessage("Haxi", "Funky", "Oh, hi Haxi!")
```