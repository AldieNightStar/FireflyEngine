# Strings and `str`

## Notes
* `str` helps make object printables
* Usually, LUA prints tables like so `{table: abcdef0xff12}`  with no idea what is inside
* `str` doing opposite. It reveals content recursively `{user="Alan", age="Backlem", items={"Knife", "Iron", "Food"}}`

## Usage
```lua
-- Just use `str` function call and it will show
str(value)
```

## Printable tables
* Tables, that has `string()` function, will be printable to `str` as well
```lua
-- Let's create table that has string() function
local flower = {a=1, b=2, c=3}
function flower:string() return "%FLOWER%" end

-- Then we print it
-- Output:
--   {itemName=Flower, itemValue=%FLOWER%}
--
-- So now flower will not be displayed as {a=1, b=2, c=3}
-- Instead it will output %FLOWER%, because of string() function
str({itemName="Flower", itemValue=flower})
```