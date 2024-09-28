# Functional Reference

## Notes
* Object that refers to static function that is registered by `FuncRef.register`
* Used for serialization into `JSON` and back
* Allows to __save__ callbacks into `JSON` if needed

## Usage
```lua
-- Let's create some function
function add(a, b)
	return a + b
end

-- Register new FuncRef
addRef = FuncRef(add, "add")

-- We can call it
addRef(2, 3)

-- Also we can set it to 'V'
V.callback = addRef
V.callback(2, 3)

-- We can also UNWRAP the function
-- It will return original function
V.callback:func()
```