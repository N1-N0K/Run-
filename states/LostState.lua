LostState = Class{__includes = BaseState}

function LostState:enter(params)
    self.score = params.score
end

function LostState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        stataeMachine:change('start')
    end
end

function LostState:render()
    love.graphics.setFont(Big_font)
    love.graphics.printf('GAME OVER!', 0, 80, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('score: ' ..tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
end