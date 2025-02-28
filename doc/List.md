# List

## Usage
* Better than `table.insert` in plain Lua
* Could be used to store value and do operations
* Supports `nil` values if need
* Has no `remove` functions. To remove something, create new list

## Usage
```lua
-- Create new List
local list = List.new()

-- Create new List with already added elements
-- Instead of () you should use {} here
local list = List.of { "Knife", "Sword", "Bread" }

-- Add some elements
-- Returns new size
list:add("Knife")
list:add("Sword")
list:add("Bread")

-- Find first index of the element
-- Returns number
list:index("Knife")

-- Get list size
-- Returns number
list:size()

-- Check list is empty or not
-- Returns boolean true/false
list:isEmpty()
list:isNotEmpty()

-- Fill list with values
-- count   - Number of items to add
-- func    - Function to call. Accepts index number
list:fill(10, function(i)
	return "Item"..i
end)

-- Create list with filtered values
-- Will return new list that has values filtered by a function
list:filter(function(item)
	return item == "Food"
end)

-- Create list with mapped values
-- Will return new list that has values mapped by a function
--
-- func       - Function that does mapping
-- removeNils - (Optional) Boolean that tells to remove nil values if true
list:map(function(item)
	return Item.new(item)
end, removeNils)

-- Creates new list that has elements since START until END indexes (Inclusive)
-- start - index of starting position
-- end   - index of ending position (Inclusive)
list:range(2, 3)

-- String representation of the list
list:string()

-- Get elements by their index
list:get(1)

-- Iterate over list
-- You can also use it in: xparis(list)
for id, value in list:items() do
	-- Do something
end

-- Unpack list items into variable
a, b = list:unpack()
```