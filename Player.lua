Player = Class {}

GRAVITY = 20

function Player:init()
    self.image = love.graphics.newImage('cat.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x =  0 +  (self.width /2)
    self.y =150

    self.dy = 0
    self.isJumping = false
end

function Player:update(dt)
  if not self.isJumping then 
    self.dy = self.dt + GRAVITY * dt
  end

  if love.keyboard.wasPressed('space') then
    self.dy = -3
    Sounds['jump']:play()
    self.isJumping = true
  end

  self.y = self.y + self.dy
end


--[[function Player:collides(obsticle)
  if (self.x + 10) + (self.width - 10) >= obsticle.x and self.x + 10 <= obsticle.x + obsticle.width then
      return true
  end
  return false
end ]]


function Player:render()
    love.graphics.draw(self.image, self.x, self.y)
end

