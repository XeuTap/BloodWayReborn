ranger_critical_hit = class ({})
LinkLuaModifier("modifier_ranger_critical_hit", "libraries/abilities/modifier_ranger_critical_hit", LUA_MODIFIER_MOTION_NONE)

function ranger_critical_hit:GetIntrinsicModifierName()
	return "modifier_ranger_critical_hit"
end