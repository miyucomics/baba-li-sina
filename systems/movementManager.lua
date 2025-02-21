local World = require("libraries.world")

return {
    filter = { "entity" },
    moveIntent = function(_, entity, intended, delta)
        if entity == intended then
            entity.position = entity.position + delta
            World:emit("move", entity)
        end
    end
}
