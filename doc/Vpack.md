# `vpack` and `vunpack` JSON serializers

## Notes
* Internal mechanism to store CLASSES into JSON with ability to distinguish one from another
* Used in `V` variables
* Adds `.class` field to objects that refers to existing class

## Usage
```lua
-- Packs object to another object, that could be then serialized by JSON
-- Removes functions and class attributes, and adds `.class` field to identify the class
local packedObject = vpack(object)

-- Unpack back the object
-- Will find the class and restore the data for it
-- Will not restore functions and callback. You need to be aware of that
local unpackedObject = vunpack(packedObject)
```