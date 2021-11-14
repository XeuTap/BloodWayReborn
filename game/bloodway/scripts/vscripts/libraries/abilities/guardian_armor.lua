guardian_armor = class ({})
LinkLuaModifier("modifier_guardian_armor", "libraries/abilities/modifier_guardian_armor", LUA_MODIFIER_MOTION_NONE)

function guardian_armor:GetIntrinsicModifierName()
	return "modifier_guardian_armor"
end