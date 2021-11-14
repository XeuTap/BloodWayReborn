hunter_critical_hit = class ({})
LinkLuaModifier("modifier_hunter_critical_hit", "libraries/abilities/modifier_hunter_critical_hit", LUA_MODIFIER_MOTION_NONE)

function hunter_critical_hit:GetIntrinsicModifierName()
	return "modifier_hunter_critical_hit"
end