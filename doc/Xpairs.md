# `xpairs`

## Notes
* Used instead of `ipairs`
* Supports `nil` in the middle of the lists
* Heavy to compute. Could be used in places, where `nil` possible to find

## Compare
* Let's create a list of values with `nil` inside
```lua
local list = {1, nil, 3, 4, 5}
```
* Using simple `ipairs`
```lua
for id, val in ipairs(list) do
	print(id, val)
end

-- Output:
-- 1 1
```
* Now using `xpairs`
```lua
for id, val in xpairs(list) do
	print(id, val)
end
-- Output:
-- 1 1
-- 2 nil
-- 3 3
-- 4 4
-- 5 5
```

## Why?
* Because `ipairs` will stop when see `nil` value
* `ipairs` thinks that, if there are `nil` values, then this is end of the list
* `xpairs` uses different approach.
	* It counts biggest number of keys to find the size
	* and doing iterations until this size is reached