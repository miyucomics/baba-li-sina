love.graphics.setLineStyle("rough")
love.graphics.setDefaultFilter("nearest", "nearest")

local World = require("libraries.world")
local Vector = require("libraries.vector")

function love.load()
    require("libraries.post")
    require("libraries.input"):load()
    World:addEntity(require("entities.entity")(Vector(0, 0)))
    World:addSystem(require("systems.inputManager"))
    World:addSystem(require("systems.entityRenderer"))
    World:emit("load")
end

function love.update(dt)
    World:emit("update", dt)
end

function love.draw()
    World:emit("draw")
end
