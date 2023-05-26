Player = Class {}

function Player:init()
    self.image = love.graphics.newImage('cat.png')
    self.widtj = self.image.getWidth()
    self.height = self.image:getHeight()

    self.x = VIRTUAL_WIDTH / 2 - (self.width /2)
    self.y = 100 - self.height

    self.dy = 0
end

function Player:update(dt)

    if love.keyboard.wasPressed('space') then
        self.dy = -5
    end

    if not self.y == 100 - self.height then
        self.dy = self.dy + GRAVIRY * dt
    end

end

function Player:render()
    love.graphics.draw(self.image, self.x, self.y)
end

function Player:collides(obsticle)
    if (self.x + 10) + (self.width - 10) >= obsticle.x and self.x + 10 <= obsticle.x + obsticle.width then
        if (self.y + 10) + (self.height - 10) >= pipe.y and self.y + 2 <= obsticle.y + obsticle.height then
            return true
        end
    end

end