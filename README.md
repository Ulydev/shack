shack
==============

shack is a LÖVE library that lets you easily add screen effects such as shake and rotation.

![demo][demo]

Easy integration with [push](https://github.com/Ulydev/push)

Setup
----------------

Require the library
```lua
local screen = require "shack"
```

Set game dimensions
```lua
screen:setDimensions(width, height) --love.graphics.getDimensions() by default
```

For [push](https://github.com/Ulydev/push) users:
```lua
screen:setDimensions(push:getDimensions())
```

Usage
----------------

Update shack
```lua
function love.update(dt)
  screen:update(dt)
end
```

Apply effects
```lua
function love.draw()
  screen:apply()
  
  --draw after applying
end
```

Shake screen
```lua
screen:setShake(20)
```

Methods and aliases
----------------

Set dimensions
```lua
screen:setDimensions(width, height)
```

Update shack
```lua
screen:update(dt)
```

Apply shack
```lua
screen:apply()
```

Set/get shake intensity
```lua
screen:setShake(shake)
//-> screen:shake

screen:getShake()
```

Set/get rotation intensity
```lua
screen:setRotation(rotation)
//-> screen:rotate

screen:getRotation()
```

Set/get shake target
```lua
screen:setShakeTarget(shakeTarget) --defaults to 0

screen:getShakeTarget()
```

Set/get rotation target
```lua
screen:setRotationTarget(rotationTarget) --defaults to 0

screen:getRotationTarget()
```

[demo]: https://media.giphy.com/media/l0K4hgmCL9PLzYYTe/giphy.gif