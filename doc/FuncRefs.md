# Functional Reference

## Notes
* Object that refers to static function that is registered by `FuncRef.register`
* Used for serialization into `JSON` and back
* Allows to __save__ callbacks into `JSON` if needed
* ⚠️ `FuncRef`'s should be registered before the game started.

## Usage
```lua
-- Register new FuncRef with function
add = FuncRef("add", function (a, b)
	return a + b
end)

-- We can call it
add(2, 3)

-- Also we can set it to 'V'
V.callback = add
V.callback(2, 3)

-- We can also UNWRAP the function
-- It will return original function
V.callback:func()
```