local Entity = require("libraries.classic"):extend()

function Entity:new(position, type)
    self.components = { "entity" }
    self.type = type
    self.position = position
end

return Entity
