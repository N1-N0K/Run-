LoseState = Class{__includes = BaseState}

function LoseState:enter(params)
    self.score = params.score
end

function LoseState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        stateMachine:change('start')
    end
end

function LoseState:render()
    love.graphics.setFont(big_font)
    love.graphics.printf('GAME OVER!', 0, 80, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('score: ' ..tostring(self.score), 0, 110, VIRTUAL_WIDTH, 'center')
end