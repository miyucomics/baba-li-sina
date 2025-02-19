local Entity = require("libraries.classic"):extend()

function Entity:new(position)
    self.components = { "entity" }
    self.position = position
end

return Entity
