local World = require("ijo.ale")
local Entity = require("libraries.classic"):extend()

function Entity:new(position, type)
    self.type = type
    self.position = position
end

function Entity:update(intendedPosition, dt)
    self.position = (intendedPosition - self.position) / 10 + self.position
end

function Entity:move(intendedPosition, movement)
    local new = intendedPosition + movement
    World:set(intendedPosition, nil)
    World:set(new, self)
end

return Entity
