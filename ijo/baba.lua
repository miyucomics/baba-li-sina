local Baba = require("ijo.ijo"):extend()

function Baba:new(position)
    Baba.super.new(self, position, "baba")
end

function Baba:draw()
    love.graphics.rectangle("fill", self.position.x * 10, self.position.y * 10, 10, 10)
end

return Baba
