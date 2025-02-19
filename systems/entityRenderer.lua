local function lerp(a, b, t)
    return a + (b - a) * t
end

return {
    filter = { "entity" },
    load = function(entity)
        entity.renderPosition = entity.position
    end,
    draw = function(entity)
        entity.renderPosition = lerp(entity.renderPosition, entity.position, 0.5)
        love.graphics.rectangle("fill", entity.renderPosition.x * 8, entity.renderPosition.y * 8, 8, 8)
    end
}
