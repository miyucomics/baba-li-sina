local Vector = require("libraries.vector")

local world = {
    map = {}
}
local width = 10
local height = 10
for i = 0, width * height - 1, 1 do
    world.map[i] = nil
end

function world:update(dt)
    for i, ijo in pairs(self.map) do
        if ijo ~= nil then
            local x = i % 10
            local y = math.floor(i / 10)
            local intendedPosition = Vector(x, y)
            ijo:update(intendedPosition, dt)
        end
    end
end

function world:draw()
    for _, ijo in pairs(self.map) do
        if ijo ~= nil then
            ijo:draw()
        end
    end
end

function world:get(pos)
    if pos.x >= 0 and pos.x < width or pos.y >= 0 and pos.y < height then
        return self.map[pos.y * height + pos.x]
    end
    return nil
end

function world:set(pos, ijo)
    if pos.x >= 0 and pos.x < width or pos.y >= 0 and pos.y < height then
        self.map[pos.y * height + pos.x] = ijo
    end
    return nil
end

return world
