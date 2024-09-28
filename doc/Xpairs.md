# `xpairs`

## Notes
* Used instead of buggy `ipairs`
* Supports `nil` in the middle of the lists

## Compare
* Let's create a list of values with `nil` inside
```lua
local list = {1, nil, 2, 3, 4}
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
-- 3 2
-- 4 3
-- 5 4
```

## Why?
* Because `ipairs` will stop when see `nil` value
* For some reason `ipairs` thinks that, if there are `nil` values, then this is end of the list
* `xpairs` uses different approach.
	* It just takes size of the list,
	* and doing iterations until this size is reached