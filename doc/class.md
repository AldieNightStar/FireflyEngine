# Class

## Notes
* In LUA there is no `class` functional
* So we have to implement by ourselves
* But no worries, `firefly` is done for us
* You can create your class by `class` function

## Define new class
```lua
-- Create your class
-- name      - Full name of the class (Better to add prefixes with namespace "game." and so forth)
-- fields... - Fields to add into the class. Will be used in "Point.new(x, y)" constructor
Point = class("game.Point", "x", "y")

-- Add some function into it
Point:calculate()
	return self.x + self.y
end

-- Add string() function to make it usable with str(...)
Point:string()
	return "Point: " .. self.x .. "/" .. self.y
end

```




## Create instance
```lua
-- Create new instance of that class
local p = Point.new(10, 20)

-- Call function of the instance
p:calculate()
```




## Check class
* Some times need to check that this table is our class
* You can do it with `IS` function
```lua
-- Will return true, if 'p' is instance of Point class
Point.IS(p)

-- Get name of the class
Point.NAME
```