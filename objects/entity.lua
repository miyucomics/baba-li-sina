local Entity = require("libraries.classic"):extend()
local Vector = require("libraries.vector")

local function lerp(a, b, t)
	return a + (b - a) * t
end

function Entity:new(x, y)
    self.position = Vector(x, y)
    self.renderPosition = Vector(x, y)
    self.tweenProgress = 0
end

function Entity:update(dt)
    self.tweenProgress = math.min(self.tweenProgress + dt * 3, 1.0)
    self.renderPosition = lerp(self.renderPosition, self.position, self.tweenProgress)
end

function Entity:draw()
	love.graphics.rectangle("fill", self.renderPosition.x * 32, self.renderPosition.y * 32, 32, 32)
end

function Entity:move(offset)
    self.renderPosition = self.position
    self.position = self.position + offset
    self.tweenProgress = 0
end

return Entity
