local Entity = require("objects.entity")
local Vector = require("libraries.vector")

local player = Entity(0, 0)

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end

function love.keypressed(key)
    if key == "left" then
        player:move(Vector(-1, 0))
    elseif key == "right" then
        player:move(Vector(1, 0))
    end

    if key == "up" then
        player:move(Vector(0, -1))
    elseif key == "down" then
        player:move(Vector(0, 1))
    end
end
