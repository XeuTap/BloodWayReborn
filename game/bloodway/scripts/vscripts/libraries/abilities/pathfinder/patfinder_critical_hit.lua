patfinder_critical_hit = class ({})
LinkLuaModifier("modifier_patfinder_critical_hit", "libraries/abilities/pathfinder/modifier_patfinder_critical_hit", LUA_MODIFIER_MOTION_NONE)

function patfinder_critical_hit:GetIntrinsicModifierName()
	return "modifier_patfinder_critical_hit"
end