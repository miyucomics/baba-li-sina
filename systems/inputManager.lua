local Input = require("libraries.input")
local World = require("libraries.world")
local Vector = require("libraries.vector")

local ruleManager = {}

return {
	filter = { "entity" },
	d_load = function(_)
		ruleManager = World:findEntity("ruleManager")
	end,
	d_update = function(system, _)
		local entities = World:findEntities(system.filter)

		local movementDirections = {
			w = Vector(0, -1),
			s = Vector(0, 1),
			a = Vector(-1, 0),
			d = Vector(1, 0),
		}

		for key, direction in pairs(movementDirections) do
			if Input:pressed(key) then
				for _, entity in pairs(entities) do
					if ruleManager:hasRule(entity, "sina") then
						World:emit("moveIntent", entity, direction)
					end
				end
			end
		end
	end,
}
