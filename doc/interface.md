# Interfaces

## Notes
* Interfaces are optional, and may be not used
* They made to be sure that certain objects (or tables) contains functions we need, before we use it
* It's better than manually check each object for functions

## Usage
```lua

-- Define interface with list of function
-- To fit, it should have functions: getStory, getTitle
--
-- Returns function
StoryGetter = INTERFACE(
	"getStory",
	"getTitle"
)

-- Test object whether it is StoryGetter, or not
-- Will return true, if value is StoryGetter
StoryGetter(value)
```

## Code sample
* In this code sample, we could see how it could be used
* Here we are using `if` in combination with `StoryGetter`, so we able to distinguish what is what:
```lua
function loadStory(o)
	
	-- Here we are testing that 'o' is interface we want
	if StoryGetter(o) then
		-- Because StoryGetter(o) returned false,
		-- We sure that 'o' has two functions: getStory, getTitle
		local story = o.getStory()
		local title = o.getTitle()

		doProcessing(title, story)
	else
		-- Otherwise we could say that this is not a StoryGetter at all
		return newError()
	end
end
```