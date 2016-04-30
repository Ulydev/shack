screen = require "shack" --require the library

function love.load()
  
  image = love.graphics.newImage("game.png")
  
  screen:setDimensions(love.graphics.getDimensions()) --adapt this depending on your game's dimensions
  
end

function love.update(dt)
  
  screen:update(dt)
  
end

function love.draw()
  
  screen:apply()
  
  love.graphics.draw(image, love.graphics.getWidth()*.5, love.graphics.getHeight()*.5, 0, 1, 1, 510, 300)
  
end

function love.keypressed(key)
  
  screen:setShake(20)
  screen:setRotation(.1)
  
  screen:zoom(1.05)
  
end