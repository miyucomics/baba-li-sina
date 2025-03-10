local pixelSize = 2
local screenWidth = love.graphics.getWidth() / pixelSize
local screenHeight = love.graphics.getHeight() / pixelSize
local screenCanvas = love.graphics.newCanvas(screenWidth, screenHeight)
-- local shader = love.graphics.newShader("assets/crt.glsl")

local old_draw = love.draw
love.draw = function()
    love.graphics.setCanvas(screenCanvas)
    love.graphics.setShader()
    love.graphics.clear()
    old_draw()
    love.graphics.setCanvas()
    love.graphics.setColor(1, 1, 1)
    -- love.graphics.setShader(shader)
    love.graphics.draw(screenCanvas, 0, 0, 0, pixelSize, pixelSize)
end

return {
    width = screenWidth,
    height = screenHeight,
}
