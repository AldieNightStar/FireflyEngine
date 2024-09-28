# Updaters

## Notes
* Register updater for your game
* Updater will ALWAYS be called on each `love.update`

## Register
```lua
-- Add Updater with some name
addUpdater(name, function(dt, name)
	-- dt   - Delta time between last and this
	-- name - Name of that updater
end)
```

## Remove
```lua
-- Remove updater by its name
removeUpdater(name)
```