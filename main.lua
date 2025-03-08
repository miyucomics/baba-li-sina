love.graphics.setLineStyle("rough")
love.graphics.setDefaultFilter("nearest", "nearest")

local World = require("ijo.ale")
local Vector = require("libraries.vector")
local Baba = require("ijo.baba")
World:set(Vector(0, 0), Baba(Vector(0, 0)))

function love.load()
    require("libraries.post")
    require("libraries.input"):load()
end

local timer = 0
function love.update(dt)
    World:update(dt)
    timer = timer + dt
    if timer > 0.5 then
        timer = 0
        for i, ijo in pairs(World.map) do
            if ijo ~= nil then
                local x = i % 10
                local y = math.floor(i / 10)
                local intendedPosition = Vector(x, y)
                ijo:move(intendedPosition, Vector(0, 1))
            end
        end
    end
end

function love.draw()
    World:draw()
end
