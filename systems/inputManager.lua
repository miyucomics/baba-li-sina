local Input = require("libraries.input")
local World = require("libraries.world")
local Vector = require("libraries.vector")

return {
    filter = { "entity" },
    d_update = function(system, dt)
        local entities = World:findEntities(system.filter)
        if Input:pressed("w") then
            for _, entity in pairs(entities) do
                entity.position = entity.position + Vector(0, -1)
                World:emit("move")
            end
        end


        if Input:pressed("s") then
            for _, entity in pairs(entities) do
                entity.position = entity.position + Vector(0, 1)
                World:emit("move")
            end
        end

        if Input:pressed("a") then
            for _, entity in pairs(entities) do
                entity.position = entity.position + Vector(-1, 0)
                World:emit("move")
            end
        end

        if Input:pressed("d") then
            for _, entity in pairs(entities) do
                entity.position = entity.position + Vector(1, 0)
                World:emit("move")
            end
        end
    end
}
