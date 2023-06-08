PlayState = Class{__includes = BaseState}

OBSTICLE_SCROLL = 50

function PlayState:init()
    self.player = Player()
    self.obsticles = {}
    self.timer = 0
    self.score = 0
end

function PlayState:update(dt)
    self.timer = self.timer + dt

    self.player:collides(obsticle)


    if self.timer > 2 then
        local x = VIRTUAL_WIDTH
        local y = 150
        table.insert(self.obsticles, Obsticle(x, y))
        self.timer = 0

    end

    
    for k, obsticle in pairs(self.obsticles) do
        if self.remove == false then 
            self.obsticles:update(dt)
        end
    end


    for k, pair in pairs(self.obsticles) do
        if pair.remove == true then 
            table.remove(self.obsticles, k)
        end
        if pair.scored == false then
            self.score = self.score + 1
            pair.scored = true
            Sounds['score']:play()
        end
    end
    
    if self.player:collides(obsticle) then  
        stateMachine:change('score', {
            score = self.score
        })
        sounds['lost']:play()
    end
    

    if self.player.y > VIRTUAL_HEIGHT then
        stateMachine:change('score', {
            score = self.score
        })
    end



    self.player:update(dt)
    
    
end

function PlayState:render()
    for k, obsticle in pairs(self.obsticles) do
        obsticle:render()  
    end

    self.player:render()

    love.graphics.setFont(score_font)
    love.graphics.print('score: '.. tostring(self.score), 10, 10)
end