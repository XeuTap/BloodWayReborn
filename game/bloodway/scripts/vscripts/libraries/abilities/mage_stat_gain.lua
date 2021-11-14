mage_stat_gain = class ({})
LinkLuaModifier("modifier_mage_stat_gain", "libraries/abilities/modifier_mage_stat_gain", LUA_MODIFIER_MOTION_NONE)

function mage_stat_gain:GetIntrinsicModifierName()
	return "modifier_mage_stat_gain"
end