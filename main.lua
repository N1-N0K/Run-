push = require 'push'
Class = require 'class'

require 'Player'
require 'Obsticle'

require 'StateMachine'

require 'states/BaseState'
require 'states/StartState'
require 'states/PlayState'
require 'states/LostState'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH  = 512
VIRTUAL_HEIGHT = 288

local background = love.graphics.newImage('background.jpg')
local background_scroll = 0
local LOOPING_POINT = 794 - 512
local BACKGROUND_SCROLL_SPEED = 50


function love.load()

    math.randomseed(os.time())

    print("shows in terminal")

    debug.debug("debug")

    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Run!')

    Big_font = love.graphics.newFont('font.ttf', 36)
    score_font = love.graphics.newFont('font.ttf', 18)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false, 
        resizable = false
    })

    stateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['lost'] = function() return lostState() end,
    }

    Sounds = {
        ['lost'] = love.audio.newSource('lost.mp3', 'static'),
        ['jump'] = love.audio.newSource('jump.wav', 'static'),
        ['score'] = love.audio.newSource('score.wav', 'static')
    }

    stateMachine:change('start')

    love.keyboard.keysPressed = {}

end


function love.update(dt)
    background_scroll = (background_scroll + BACKGROUND_SCROLL_SPEED * dt) % LOOPING_POINT

    love.keyboard.keysPressed = {}

    stateMachine:update(dt)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true

    if key =='escape' then
        love.event.quit()
    end
end



function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end


function love.resize(w, h)
    push:resize(w, h)
end


function love.draw()
    push:start()

     love.graphics.draw(background, -background_scroll, 0)

     stateMachine:render()
     
    push:finish()
end