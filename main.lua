love.graphics.setLineStyle("rough")
love.graphics.setDefaultFilter("nearest", "nearest")

local World = require("libraries.world")
local Vector = require("libraries.vector")

function love.load()
    require("libraries.post")
    require("libraries.input"):load()
    World:addEntity(require("entities.ruleManager")())
    World:addEntity(require("entities.ijo")(Vector(0, 0), "baba"))
    World:addSystem(require("systems.inputManager"))
    World:addSystem(require("systems.movementManager"))
    World:addSystem(require("systems.levelRenderer"))
    World:emit("load")
end

function love.update(dt)
    World:emit("update", dt)
end

function love.draw()
    World:emit("draw")
end
