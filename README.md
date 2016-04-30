shack
==============

shack is a LÖVE library that lets you easily add screen effects such as shake and rotation.

![demo][demo]

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

Set/get rotation
```lua
screen:setRotation(rotation)
//-> screen:rotate

screen:getRotation()
```

Set/get scale intensity
```lua
screen:setScale(x, y)
//-> screen:zoom

screen:getScale()
```

Set/get shear intensity
```lua
screen:setShear(x, y)
//-> screen:tilt

screen:getShear()
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

Set/get scale target
```lua
screen:setScaleTarget(x, y) --defaults to 1, 1

screen:getScaleTarget()
```

Set/get shear target
```lua
screen:setShearTarget(x, y) --defaults to 0, 0

screen:getShearTarget()
```

[demo]: https://media.giphy.com/media/l0K4hgmCL9PLzYYTe/giphy.gif
