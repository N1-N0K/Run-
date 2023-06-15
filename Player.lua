Player = Class {}

GRAVITY = 5

CONSTANT = -25

function Player:init()
    self.image = love.graphics.newImage('cat.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = 0 + (self.width / 2)
    self.y = 180

    self.dy = 0
    self.isJumping = false
end

function Player:update(dt)
    if self.isJumping == true then 
        self.dy = self.dy + GRAVITY * dt
        GRAVITY = 5
    end

    if love.keyboard.wasPressed('space') and self.y == 180 then
        self.dy = -2.6
        sounds['jump']:play()
        self.isJumping = true
    elseif not love.keyboard.wasPressed('space') then
      self.isJumping = false
    end

    if self.isJumping == false then
      if self.y < 180 then 
        self.dy = self.dy + GRAVITY * dt
      else 
        self.y = 180
        self.dy = 0
        GRAVITY = 0
      end
    end

    self.y = self.y + self.dy 
end

function Player:collides(obstacle)
  if self.x + self.width >= obstacle.x - CONSTANT and self.x + CONSTANT <= obstacle.x + obstacle.width and
     self.y + self.height >= obstacle.y - CONSTANT and self.y + CONSTANT <= obstacle.y + obstacle.height then
      return true
  end
  return false
end

function Player:render()
    love.graphics.draw(self.image, self.x, self.y)
end