PlayState = Class{__includes = BaseState}

OBSTICLE_SCROLL = 50

function PlayState:init()
    self.player = player()
    self.obsticle = obsticle()
    self.timer = 0
    self.score = 0
end

function PlayState:update(dt)
    print('play')
    self.timer = self.timer + dt

    if self.timer > 2 then
        local x = VIRTUAL_WIDTH
        local y = 100
        table.insert(self.obsticle, obsticles(x, y))
        self.timer = 0
    end

    for k,pair in self.obsticle do
        if pair.remove == true then
            table.remove(self.obsticle, k)
        end
        if pair.scored == false then
            self.score = self.score + 1
            pair.scored = true
        end
    end

    obsticle:update(dt)

    for k, pair in pairs(self.obsticle) do
		for i, pair in pairs(sel.obsticle) do
			if self.player:collides(pipe) then
				stateMachine:change('score', {
					score = self.score
				})
			end
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

    self.player:render()

    love.graphics.setFont(score_font)
    love.grpahics.print('score: '.. tostring(self.score), 10, 10)
end