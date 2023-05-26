Obsticle = Class {}

function Obsticle:init()
    self.image = love.graphics.newImage('obsticle.png')
    self.width = love.graohics:getWidth()
    self.height = self.image:getHeight()

    self.x = VIRTUAL_WIDTH
    self.y = y
end

function Obsticle:update(dt)
    self.x = self.x + OBSTICLE_SCROLL * dt
end

function Obsticle:render()
    love.graphics.draw(self.image, self.x, self.y)
end