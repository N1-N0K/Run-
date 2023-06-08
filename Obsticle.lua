Obsticle = Class {}

OBSTICLE_SCROLL = 50

function Obsticle:init(x, y)
    self.image = love.graphics.newImage('obsticle.png')
    self.width = love.graphics:getWidth()
    self.height = self.image:getHeight()

    self.x = VIRTUAL_WIDTH
    self.y = 150

    self.remove = false
	  self.scored = false
end

function Obsticle:update(dt)
    print("obsticle appearing")
    self.x = self.x - OBSTICLE_SCROLL
    if self.x < 0 - self.x then
        self.remove = true
    end 
end

function Obsticle:render()
    love.graphics.draw(self.image, self.x, self.y)
end