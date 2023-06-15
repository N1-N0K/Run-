PlayState = Class{__includes = BaseState}


function PlayState:init()
    self.player = Player()
    self.obstacles = {}
    self.timer = 0
    self.score = 0
end

function PlayState:update(dt)
    self.timer = self.timer + dt

    if self.timer > 2 then
        local x = VIRTUAL_WIDTH
        local y = 150
        table.insert(self.obstacles, Obstacle(x, y))
        self.timer = 0
    end

    for k, obstacle in pairs(self.obstacles) do
        if not obstacle.remove then
            obstacle:update(dt)
        end
            
        if obstacle.scored == false and self.player.x > obstacle.x + obstacle.width then
            print('scoring')
            self.score = self.score + 1
            obstacle.scored = true
            sounds['score']:play()
        end
        
      
        if self.player:collides(obstacle) then
            stateMachine:change('lose', {
                score = self.score
            })
            sounds['lose']:play()
        end
    end

    for k = #self.obstacles, 1, -1 do
        if self.obstacles[k].remove then
            table.remove(self.obstacles, k)
        end
    end

    if self.player.y > VIRTUAL_HEIGHT then
        stateMachine:change('score', {
            score = self.score
        })
    end

    self.player:update(dt)
end

function PlayState:render()
    for k, obstacle in pairs(self.obstacles) do
        obstacle:render()  
    end

    self.player:render()

    love.graphics.setFont(score_font)
    love.graphics.print('score: '.. tostring(self.score), 10, 10)
end