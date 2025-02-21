local RuleManager = require("libraries.classic"):extend()

local function table_contains(tbl, x)
	local found = false
	for _, v in pairs(tbl) do
		if v == x then
			found = true
		end
	end
	return found
end

function RuleManager:new()
	self.components = { "ruleManager" }
	self.rules = {
		baba = { "sina" },
	}
end

function RuleManager:hasRule(entity, rule)
	return table_contains(self.rules[entity.type] or {}, rule)
end

return RuleManager
