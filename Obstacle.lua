Obstacle = Class {}

OBSTACLE_SCROLL = 110

function Obstacle:init(x, y)
    self.image = love.graphics.newImage('obstacle.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = VIRTUAL_WIDTH
    self.y = 205

    self.remove = false
	self.scored = false
end

function Obstacle:update(dt)
    print(self.width)
    self.x = self.x - OBSTACLE_SCROLL * dt
    if self.x < 0 - self.x then
        self.remove = true
    end 
end

function Obstacle:render()
    love.graphics.draw(self.image, self.x, self.y)
end