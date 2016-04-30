lue
==============

lue is a LÖVE library that allows you to display hue color effects in your game.

See [HSL](https://en.wikipedia.org/wiki/HSL_and_HSV)

Setup
----------------

```lua
local lue = require "lue" --require the library
```

Usage
----------------

Update hue
```lua
function love.update(dt)
  lue:update(dt)
end
```

Get hue color
```lua
function love.draw()
  lue:getColor(50, 100)
end
```

Methods
----------------

Update hue
```lua
lue:update(dt)
```

Get hue color
```lua
lue:getColor(saturation, lightness, opacity)
```
All values range from **0** to **255**.

Set/get the global color intensity of lue - useful for spontaneous color effects such as explosions
```lua
lue:setIntensity(intensity)
lue:getIntensity()
```

Set/get hue speed
```lua
lem:setSpeed(speed)
lem:getSpeed()
```

Get the current hue value (0-255)
```lua
lue:getHue()
```