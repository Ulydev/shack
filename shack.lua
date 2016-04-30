-- shack.lua v0.1

-- Copyright (c) 2015 Ulysse Ramage
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

local shack = {
  shaking = 0,
  shakingTarget = 0,
  
  rotation = 0,
  rotationTarget = 0,
  
  shear = { x = 0, y = 0 },
  shearTarget = { x = 0, y = 0 },
  
  width = love.graphics.getWidth(),
  height = love.graphics.getHeight()
}
setmetatable(shack, shack)

--[[ Private ]]--

local function lerp(a, b, k) --smooth transitions
  if a == b then
    return a
  else
    if math.abs(a-b) < 0.005 then return b else return a * (1-k) + b * k end
  end
end

--[[ Public ]]--

function shack:setDimensions(width, height)
  self.width, self.height = width, height
  return self
end

function shack:update(dt)
  
  self.shaking = lerp(self.shaking, self.shakingTarget, 7*dt)
  self.rotation = lerp(self.rotation, self.rotationTarget, 7*dt)
  
  self.shear.x = lerp(self.shear.x, self.shearTarget.x, 7*dt)
  self.shear.y = lerp(self.shear.y, self.shearTarget.y, 7*dt)

end

function shack:apply()
  
  love.graphics.translate(self.width*.5, self.height*.5)
  love.graphics.rotate((math.random()-.5)*self.rotation)
  love.graphics.translate(-self.width*.5, -self.height*.5)
  
  love.graphics.translate((math.random()-.5)*self.shaking, (math.random()-.5)*self.shaking)
  
  love.graphics.shear(self.shear.x*.01, self.shear.y*.01)
  
  return self
end

--

function shack:setShake(shaking)
  self.shaking = shaking or 0
  return self
end

function shack:setRotation(rotation)
  self.rotation = rotation or 0
  return self
end

function shack:setShear(x, y)
  self.shear = { x = x or 0, y = y or 0 }
  return self
end

function shack:setShakeTarget(shaking)
  self.shakingTarget = shaking or 0
  return self
end

function shack:setRotationTarget(rotation)
  self.rotationTarget = rotation or 0
  return self
end

function shack:setShearTarget(x, y)
  self.shearTarget = { x = x or 0, y = y or 0 }
  return self
end

--

function shack:getShake() return self.shaking end
function shack:getShakeTarget() return self.shakingTarget end

function shack:getRotation() return self.rotation end
function shack:getRotationTarget() return self.rotationTarget end

function shack:getShear() return self.shear.x, self.shear.y end
function shack:getShearTarget() return self.shearTarget.x, self.shearTarget.y end

--[[ Aliases ]]--

function shack:shake(...) return self:setShake(...) end
function shack:rotate(...) return self:setRotation(...) end
function shack:tilt(...) return self:setShear(...) end

--[[ End ]]--

return shack