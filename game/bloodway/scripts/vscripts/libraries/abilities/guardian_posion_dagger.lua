guardian_posion_dagger = class ({})
LinkLuaModifier("modifier_guardian_posion_dagger", "libraries/abilities/modifier_guardian_posion_dagger", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_guardian_posion_dagger_debuff", "libraries/abilities/modifier_guardian_posion_dagger_debuff", LUA_MODIFIER_MOTION_NONE)


function guardian_posion_dagger:GetIntrinsicModifierName()
	return "modifier_guardian_posion_dagger"
end
