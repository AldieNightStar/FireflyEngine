# Console

## Notes
* Text overlay in your game, to print or debug with `print`
* Works only when you develop and WILL NOT work in RELEASE
* Can be used to debug some stuff


## Usage
```lua
-- Print something to that console
print("Hello")
```

## Config
```lua
-- Maximum lines to show in console
-- Too much value will cause to go outside of the Screen
console.lines=25,

-- Size for the font to print
console.fontSize=20,

-- Max size of single horizontal line
-- Too much value will cause to go outside of the Screen
console.maxLineSize=130,

-- Just enable/disable the console
-- Additional;y toggled by `~` key (In dev mode)
console.enabled=true,
```