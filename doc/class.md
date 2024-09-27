# Class

## Notes
* In LUA there is no `class` functional
* So we have to implement by ourselves
* But no worries, `firefly` is done for us
* You can create your class by `class` function

## Define new class
```lua
-- Create your class
-- name      - Full name of the class. Should contain namespace at the beginning to not collide with others
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

-- Test whether this is class at all
-- Will return true if this is a real CLASS table
IS_CLASS(Point)
```


## Get class by name
```lua
-- Gets class by name, if it's not in global variables
local Point = CLASS_BY("game.Point")
```