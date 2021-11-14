warrior_shield = class ({})
LinkLuaModifier("modifier_warrior_shield", "libraries/abilities/modifier_warrior_shield", LUA_MODIFIER_MOTION_NONE)

function warrior_shield:GetIntrinsicModifierName()
	return "modifier_warrior_shield"
end